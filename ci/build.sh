#!/bin/bash -xe

readonly HOST=$1
readonly NODE=$2

vagrant up $HOST --provider=digital_ocean
bundle exec rake itamae:$HOST:$NODE
bundle exec rake spec:$HOST:$NODE
