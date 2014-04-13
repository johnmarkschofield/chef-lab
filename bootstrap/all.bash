#!/bin/bash

set -e # Exit on any error
export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get -yq install curl

apt-get -yq install ruby1.9.3
