#!/usr/bin/env bash

. ../linux/util.sh

install() {
  sudo apt install -y "$@"
}