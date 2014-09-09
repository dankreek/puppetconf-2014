#!/bin/sh

START_COMMAND="cd /opt/pe-jvm-puppet-extensions/ && screen -S puppetmaster -d -m ./run-master.sh"

ssh puppetmaster1 "$START_COMMAND"
ssh puppetmaster2 "$START_COMMAND"

