export LD_LIBRARY_PATH=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/build/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/dpdk/build/lib:$LD_LIBRARY_PATH

# ./build/examples/hello_bdev --json ./examples/bdev/hello_world/bdev_photon.json
# ./build/examples/hello_world
# ./build/examples/nvmf -m 0xf -r /var/tmp/spdk.sock

./build/examples/perf -q 64 -o 4095 -w randrw -M 30 -l -t 60 \
	-r "trtype:tcp adrfam:IPv4 traddr:127.0.0.1 trsvcid:4420 subnqn:nqn.2016-06.io.spdk:cnode1"