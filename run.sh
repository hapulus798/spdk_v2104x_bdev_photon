export LD_LIBRARY_PATH=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/build/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/dpdk/build/lib:$LD_LIBRARY_PATH
# ./build/examples/hello_bdev --json ./examples/bdev/hello_world/bdev.json
# ./build/examples/hello_world
# ./build/examples/nvmf -m 0xf -r /var/tmp/spdk.sock
./build/bin/nvmf_tgt --logflag=bdev_photon
# ./build/examples/hello_bdev --json ./examples/bdev/hello_world/bdev_photon.json