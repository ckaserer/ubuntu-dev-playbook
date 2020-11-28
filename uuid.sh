#!/bin/bash

curl -sSL $1 > tmp.zip && unzip -o tmp.zip >/dev/null && cat metadata.json | grep uuid