##!/bin/bash

export IPT_OPTIONS='-L -v --line-numbers --numeric'
export HALBTRENNER='========================================'

echo ''
echo ''
echo "${HALBTRENNER}IPv4${HALBTRENNER}"
iptables ${IPT_OPTIONS} |\
  sed -E 's/^Chain.*$/\x1b[4;34;47m&\x1b[0m/' |\
  sed -E 's/^num.*/\x1b[4;33;44m&\x1b[0m/' |\
  sed -E '/([^y] )((REJECT|DROP))/s//\1\x1b[31;1m\3\x1b[0m/' |\
  sed -E '/([^y] )(ACCEPT)/s//\1\x1b[32m\2\x1b[0m/' |\
  sed -E '/([ds]pt[s]?:)([[:digit:]]+(:[[:digit:]]+)?)/s//\1\x1b[33;1m\2\x1b[0m/' |\
  sed -E '/([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}(\/([[:digit:]]){1,3}){0,1}/s//\x1b[36;1m&\x1b[0m/g' |\
  sed -E '/([^n] )(LOGDROP)/s//\1\x1b[34;1m\2\x1b[0m/'|\
  sed -E '/([^n] )((lo|eth0|enp7s0))/s//\1\x1b[35;1m\2\x1b[0m/'|\
  sed -E 's/ LOG /\x1b[34;1m&\x1b[0m/'|\
  sed -E 's/ ((tcp|udp|icmp|all)) /\x1b[35m&\x1b[0m/'|\
  sed -E '/([ds]port[s]? )([[:digit:]]+(:[[:digit:]]+)?.*)/s//\1\x1b[33;1m\2\x1b[0m/'
  #---------------------------------------------------------------------------------------------------------
  ## Line 10 underlines chain "section titles"
  ## Line 11 makes the column headers yellow
  ## Line 12 highlights REJECT and DROP as red everwhere except chain "section titles"
  ## Line 13 highlights ACCEPT as green
  ## Line 14 highlights port numbers as yellow
  ## Line 15 highlights IP address and CIDR blocks as cyan
  ## Line 16 highlights LOGDROP as yellow everywhere except chain "section titles"
  ## Line 18 highlights LOG everywhere as cyan
echo ''
echo ''
echo "${HALBTRENNER}IPv6${HALBTRENNER}"
ip6tables ${IPT_OPTIONS} |\
  sed -E 's/^Chain.*$/\x1b[4;34;47m&\x1b[0m/' |\
  sed -E 's/^num.*/\x1b[4;33;44m&\x1b[0m/' |\
  sed -E '/([^y] )((REJECT|DROP))/s//\1\x1b[31;1m\3\x1b[0m/' |\
  sed -E '/([^y] )(ACCEPT)/s//\1\x1b[32m\2\x1b[0m/' |\
  sed -E '/([ds]pt[s]?:)([[:digit:]]+(:[[:digit:]]+)?)/s//\1\x1b[33;1m\2\x1b[0m/' |\
  sed -E '/([^n] )(LOGDROP)/s//\1\x1b[34;1m\2\x1b[0m/'|\
  sed -E '/([^n] )((lo|eth0|enp7s0))/s//\1\x1b[35;1m\2\x1b[0m/'|\
  sed -E 's/ LOG /\x1b[34;1m&\x1b[0m/'|\
  sed -E 's/ ((tcp|udp|icmp|all)) /\x1b[35m&\x1b[0m/'|\
  sed -E '/([ds]port[s]? )([[:digit:]]+(:[[:digit:]]+)?.*)/s//\1\x1b[33;1m\2\x1b[0m/'
  #sed -E '/([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}(\/([[:digit:]]){1,3}){0,1}/s//\x1b[36;1m&\x1b[0m/g' |\
  #---------------------------------------------------------------------------------------------------------
  ## Line 34 underlines chain "section titles"
  ## Line 35 makes the column headers yellow
  ## Line 36 highlights REJECT and DROP as red everwhere except chain "section titles"
  ## Line 37 highlights ACCEPT as green
  ## Line 38 highlights port numbers as yellow
  ## Line 38 highlights LOGDROP as yellow everywhere except chain "section titles"
  ## Line 41 highlights LOG everywhere as cyan
echo ''
echo ''
exit 0
