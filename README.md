# eth2stake

Some docker scripts and stuff to run eth2 staking on mainnet.
It uses docker to make install easy.  

 * geth for eth1
 * lighthouse for eth2 (beacon and client)
 * eth2.0-deposit-cli for key generation

## DISCLAIMER

While I am in general an expert on *SOME* cryptocurrencies, I am *NOT* an expert on ETH2.0.

I could have some of this very wrong.  This is what I am doing, but it might not be right.

You might lose funds or be slashed or be made fun of on the interwebs.

I tell people what to do with their crypto all the damn time and I've never written a 
disclaimer like this.  Pay attention to it.

These scripts are working well for me on mainnet.  

There is one main rule: NEVER RUN MULTIPLE VALIDATOR CLIENTS (VC) WITH YOUR KEYS LOADED.

Safe things to do:
* Restart a vc with the same volume (lighthouse-vc).  The database there will protect you from slashing.
* Stop a vc.  Wait 20 minutes.  Start the vc somewhere else or with a new volume.  No need to copy database, it is out of date by now anyways.

Bad/Questionable things to do:
* Have you keys loaded in multiple VC volumes (on different hosts or whatever) and just don't start one.  You are an accidental start away from being slashed.  If you have a backup host, don't import the validator keys until you need them.
* Copy database from one machine to another to move a VC quickly.  You are a path mistake/copy mistake away from being slashed.

The loss of income from a few hours or days are *nothing* compared to being slashed.  A day's income for a validator: 0.02 ETH or so.  Slashing: -16 ETH, plus the remaining 16 ETH are locked until phase who_the_hell_knows.


## INSTRUCTIONS

### Docker
 
These scripts assume you have docker installed.
For debian, here are the quick docker install commands:

    apt-get remove docker docker-engine docker.io containerd runc
    apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian  $(lsb_release -cs) stable"
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io docker-compose

You'll need to add the user you plan on using to the docker group.  Edit /etc/group

### Additional packages

Some of the scripts use the json query program and curl
 
    apt-get install jq curl

### Disk Space

Geth is a monster.  Not sure how big lighthouse eth2 db will end up being.
These scripts assume that /var/lib/docker has at least 300GB of space.  Plan on it growing.

### Path

These scripts assume the script are in the path.  Edit .bashrc or .profile or something.

### Components

* geth - eth1 node.  Downloads all of eth1 and validates it.
* lighthouse-b - eth2 beacon node.  Talks to other nodes for eth2 magic.
* lighthouse-vc - eth2 validation client.  Actually has your keys and signs stuff.

### Keys and containers

After you get docker installed, go ahead and geth-start.sh
That is going to take some time.  Probably a few days.

Then use eth2deposit to make some keys.
  
    eth2deposit.sh new-mnemonic --num_validators 1 --mnemonic_language english --chain mainnet

This will make some keys in ~/data/validator_keys
Follow the instructions or you are an idiot and everyone will laugh at you.  Save you seed words somewhere safe.

Next you need to import those keys into where lighthouse can use them thusly:

    lighthouse-cli.sh --network mainnet account validator import --directory /root/validator_keys

### Operation

Geth takes forever to sync.  Once it is done, geth-height.sh will return something like:

    {
      "jsonrpc": "2.0",
      "id": 1,
      "result": "0xac5a51"
    }

Look at logs:

    docker logs -f geth
    docker logs -f lighthouse-b
    docker logs -f lighthouse-vc

Update and restart:

    eth2-update.sh

Don't get slashed.  If you have some problem and things are weird, stop lighthouse-vc for at least 20 minutes, probably more like a hour.  This will make sure your lighthouse-vc doesn't contradict an earlier run and get you slashed.

This advice applies when restoring from backup, recovering from disk corruption or whatever.

The docker setups in the start scripts should automatically restart these services with your host.

### Configuration

There is a file eth2-settings.sh.  Any of these settings can be overridden by making a script named
'eth2-settings.local.sh', making it mod 755 and put it in the path.



### Funding

After you are done with this setup, you are ready to fund you validators.  Take the files in ~/data/validator_keys
and *SLOWLY* go through the steps on https://launchpad.ethereum.org/

Take your time.  Read the screen.

### TODO

* Once lighthouse is stable, switch to docker stable tag rather than latest
* Add notes about monitoring (once it is clear how to do that)

### How to use CloudLock

EXPERIMENTAL

https://github.com/fireduck64/cloudlock/tree/main/lighthouse

Cloudlock is a locking agent that can be used as a wrapper around lighthouse-vc.
If you want to run multiple VCs and have them automatically failover, here are some example configs:

```
export DOCKER_LIGHTHOUSE=repo.1209k.com/1209k/cloudlock

export CLOUDLOCK_SETTINGS=" \
  -e cloudlock_aws_key_id=KEY_ID \
  -e cloudlock_aws_secret=SECRET \
  -e cloudlock_dynamodb_table=eth2-vc \
  -e cloudlock_aws_region=us-west-2 \
  -e cloudlock_lock_label=lighthouse-vc \
  -e cloudlock_my_id=node1"

export CLOUDLOCK_COMMAND="cloudlock"

```

This uses the docker file built from https://github.com/fireduck64/cloudlock/tree/main/lighthouse

You'll have to follow the setup instructions over in cloudlock for how to setup the AWS DynamoDB table and user.


