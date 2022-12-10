#!/usr/bin/env -S zsh -eu
setopt extended_glob

readonly SCRIPT_NAME=$(basename $0)
readonly termColorClear='\033[0m'
readonly termColorInfo='\033[1;32m'
readonly termColorWarn='\033[1;33m'
readonly termColorErr='\033[1;31m'
echoInfo() {
    echo -e "${termColorInfo}$1${termColorClear}"
}
echoWarn() {
    echo -e "${termColorWarn}$1${termColorClear}"
}
echoErr() {
    echo -e "${termColorErr}$1${termColorClear}"
}

srv=$(dig +short a server-0.9)
sleep 1
sudo tcpdump --interface=eth0 --packet-buffered -w /workspace/tmp/request-0.9-tcpdump.pcap -W 1 -G 3 &
pid=$!
sleep 1
echo -e 'GET /\r\n' | nc $srv 8080
echo
sleep 1
fg
