# eth2stake

Some docker scripts and stuff to run eth2 staking on mainnet.

## DISCLAIMER

While I am in general an expert on *SOME* cryptocurrencies, I am *NOT* an expert on ETH2.0.

I could have some of this very wrong.  This is what I am doing, but it might not be right.

You might lose funds or be slashed or be made fun of on the interwebs.

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

### Additional packages

Some of the scripts use the json query program and curl
 
    apt-get install jq curl

### Disk Space

Geth is a monster.  Not sure how big lighthouse eth2 db will end up being.
These scripts assume that ~/data has at least 300GB of space.  Plan on it growing.

### Path

These scripts assume the script are in the path.  Edit .bashrc or .profile or something.

### Components

* geth - eth1 node.  Downloads all of eth1 and validates it.
* lighthouse-b - eth2 beacon node.  Talks to other nodes for eth2 magic.
* lighthouse-vc - eth2 validation client.  Actually has your keys and signs stuff.

### Keys and containers

After you get docker installed, go ahead and geth-start.sh
That is going to take some time.

Then use eth2deposit to make some keys.
  
    eth2deposit.sh new-mnemonic --num_validators 1 --mnemonic_language english --chain mainnet

This will make some keys in ~/data/validator_keys
Follow the instructions or you are an idiot and everyone will laugh at you.  Save you seed words somewhere safe.

Next you need to import those keys into where lighthouse can use them thusly:

    lighthouse-cli.sh --testnet mainnet account validator import --directory /root/validator_keys

### Operation

Geth takes forever to sync.  Once it is done, geth-height.sh will return something like:

{
  "jsonrpc": "2.0",
  "id": 1,
  "result": "0xac5a51"
}


Look at logs:

docker logs -f <thing> 
(geth, lighthouse-b, lighthouse-vc)

Update and restart:

eth2-update.sh

Don't get slashed.  If you have some problem and things are weird, stop lighthouse-vc for at least 20 minutes, probably more like a hour.  This will make sure your lighthouse-vc doesn't contradict an earlier run and get you slashed.

This advice applies when restoring from backup, recovering from disk corruption or whatever.

In all honestly, I don't know.

The docker setups in the start scripts should automatically restart these services with your host.

### Funding

After you are done with this setup, you are ready to fund you validators.  Take the files in ~/data/validator_keys
and *SLOWLY* go through the steps on https://launchpad.ethereum.org/

Take your time.  Read the screen.


