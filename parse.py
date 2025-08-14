import os
import re


rootdir = "./fio_test_res"
fnames = os.listdir(rootdir)
for fname in fnames:
    iodepth = fname.split(".")[0].split("_")[0]
    bs = fname.split(".")[0].split("_")[1]
    path = "{}/{}".format(rootdir, fname)
    with open(path, "r") as f:
        lines = f.readlines()
        last_line = lines[-1].strip()
        bw_match = re.search(r'bw=([0-9.]+[KMG]?i?B/s)', last_line)
        if bw_match:
            bw = bw_match.group(1)
            print("{},{},{}".format(iodepth, bs, bw))