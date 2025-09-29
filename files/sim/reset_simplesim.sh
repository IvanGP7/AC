#!/bin/bash
rm -rf "simplesim-3.0_acx2"

tar -xvf "simplesim-3.0_acx2.tgz"

cd "simplesim-3.0_acx2/"

make config-alpha
sleep 1
make
