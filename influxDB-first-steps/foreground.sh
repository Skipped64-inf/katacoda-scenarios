#!/bin/bash
apt-get update -y
apt install -y figlet
docker pull influxdb
clear
figlet -f slant "InfluxDB"