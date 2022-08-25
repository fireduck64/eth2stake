#!/bin/bash

set -eu

cd /secrets
rm -f .jwt_secret.tmp.$$
echo $JWT_SECRET > .jwt_secret.tmp.$$
mv .jwt_secret.tmp.$$ jwtsecret



