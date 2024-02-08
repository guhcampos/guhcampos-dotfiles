#!/bin/bash

#
#  Verbose ping a hostname: a series of single packet pings. Useful to
# keep pinging a hostname without having to remember which window is
# pinging what host.
#
function vping {

    host=$1

    if [ -z $host ];
    then
        echo "Please provide a hostname to ping"
        echo
        return 1
    fi

    while true
        do ping -oc 1 $host; sleep 1
    done

    return $?
}
#
#  Transitive ping a hostname: ssh to host A then ping host B from there
#
function tping {

    host=$1
    proxy=$2

    if [ -z $host -o -z $proxy ]
    then
        echo "tping: Transitively ping a hostname through a proxy using SSH"
        echo
        echo "Usage:"
        echo "tping $hostname $proxyname"
        echo
        return 1
    fi

    while true
        do ssh $proxy "ping -c 1 $host"
           sleep 1
    done

    return $?
}

#
# PS for a proc name
#
function psproc {
    ps -C $1 -o pid,cmd
}

#
# Similar to `watch` but works on Mac OS X and has colors =D
#
function mywatch {
    while true
      do sleep 1
         clear
         date
         $*
      done
}
