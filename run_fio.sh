export LD_LIBRARY_PATH=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/build/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/dpdk/build/lib:$LD_LIBRARY_PATH

myfio=/home/hongjingxuan.hjx/fio/fio
myfiocfg=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/examples/nvme/fio_plugin/example_config.fio

# bs_values=(512b 1k 4k 16k 64k 128k 512k)
# iodepth_values=(1 16 64 128)

# for iodepth in "${iodepth_values[@]}"; do
#     for bs in "${bs_values[@]}"; do
#         echo "Running fio with iodepth=$iodepth, bs=$bs"
#         LD_PRELOAD=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/build/fio/spdk_nvme $myfio $myfiocfg --bs=$bs --iodepth=$iodepth > ./fio_test_res/${iodepth}_${bs}.txt
#     done
# done

LD_PRELOAD=/home/hongjingxuan.hjx/spdk/spdk_v21.04.x_test/build/fio/spdk_nvme $myfio $myfiocfg --bs=128k --iodepth=16