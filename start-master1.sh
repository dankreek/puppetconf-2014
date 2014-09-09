#!/bin/sh

START_COMMAND="cd /opt/pe-jvm-puppet-extensions/ && ./run-master.sh"

ssh puppetmaster1 "$START_COMMAND"

