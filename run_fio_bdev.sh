export LD_LIBRARY_PATH=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/build/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/dpdk/build/lib:$LD_LIBRARY_PATH

myfio=/home/hongjingxuan.hjx/fio/fio
myfiocfg=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/examples/bdev/fio_plugin/example_config.fio

LD_PRELOAD=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/build/fio/spdk_bdev $myfio $myfiocfg --bs=4k --iodepth=128