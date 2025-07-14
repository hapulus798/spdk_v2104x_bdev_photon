#!/bin/bash
sudo -v
sudo scripts/rpc.py nvmf_create_transport -t TCP -u 16384 -m 8 -c 8192
sudo scripts/rpc.py bdev_photon_create --num_blocks 1024
sudo scripts/rpc.py nvmf_create_subsystem nqn.2016-06.io.spdk:cnode1 -a -s SPDK00000000000001 -d SPDK_Controller1
sudo scripts/rpc.py nvmf_subsystem_add_ns nqn.2016-06.io.spdk:cnode1 Photon0
sudo scripts/rpc.py nvmf_subsystem_add_listener nqn.2016-06.io.spdk:cnode1 -t tcp -a 127.0.0.1 -s 4420