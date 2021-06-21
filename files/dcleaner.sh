#!/bin/bash


if [ $# -eq 0 ] || [ "$1" = "help" ] || [ "$1" = "h" ]; then
    echo "Docker Cleaner v1.0"
    echo ""
    echo "Usage: "
    echo "  cleaner.sh COMMAND [options] [images]"
    echo "Commands:"
    echo "  prune       Prune dangling images"
    echo "  all         Remove unused images"
    echo "  old         Remove unused images older than 30 days"
    echo "      -t      specify custom minimum image age or timestamp"
    echo "              As Unix timestamps, date formatted timestamps, or Go duration strings"
    echo "              (e.g. 10h for deleting images older than 10 hours)"
    echo "  help        Display this message"
    exit 0
fi

## Temporarily starts containers to avoid deleting certain images
container_temp_ids=()
function startTempContainers {
    while [[ $# -gt 0 ]]
    do
        image="$1"
        shift
        c=$(docker create "$image")
        container_temp_ids+=("$c")
        # echo "create $c"
    done
}
readonly -f startTempContainers

## Stops temporarily created containers
function stopTempContainers {
    for t in "${container_temp_ids[@]}"; do
        s=$(docker rm $t)
        # echo "remove $t"
    done
}
readonly -f stopTempContainers

# PRUNE
if [ "$1" = "prune" ] || [ "$1" = "p" ]; then
    shift
    startTempContainers "$@"
    docker image prune --force
    stopTempContainers
    exit 0
fi

# ALL
if [ "$1" = "all" ] || [ "$1" = "a" ]; then
    shift
    startTempContainers "$@"
    docker image prune -a --force
    stopTempContainers
    exit 0
fi

# OLD
if [ "$1" = "old" ] || [ "$1" = "o" ]; then
    shift
    until="720h"
    if [ "$1" = "-t" ]; then
        until=$2
        shift
        shift
        # echo "Minimum age: $until"
    fi

    startTempContainers "$@"
    docker image prune -a --force --filter "until=$until"
    stopTempContainers
    exit 0
fi

echo "Unknown command"
echo "Use cleaner.sh help"


#feature: label
#docker image prune -a --force --filter "label=value"