#!/bin/bash

apt update && apt full-upgrade -y
apt install curl jq -y

cast_version=$(curl -s https://api.github.com/repos/ekristen/cast/releases/latest | jq -r '.tag_name')
wget "https://github.com/ekristen/cast/releases/download/$cast_version/cast-$cast_version-linux-amd64.deb" -O /tmp/cast_$cast_version.deb
dpkg -i /tmp/cast_$cast_version.deb
cast install teamdfir/sift-saltstack