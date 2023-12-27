#!/bin/bash

ngrok tcp --log stdout 22 | tee >(
    grep "started tunnel" -m 1 |
    sed -E 's#.*url=tcp://(.*)#://const_server@\1#' |
    xargs $(dirname $(realpath $0))/ngrok-bot.sh
)
