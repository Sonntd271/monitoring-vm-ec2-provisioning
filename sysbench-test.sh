#! /bin/bash
# Execute this for testing load on VM1 after the instance finishes provisioning

sudo sysbench --test=cpu --cpu-max-prime=200000 run

# Testing with an increasing number of threads
for each in 1 2 4 8 16 32 64; do 
    sudo sysbench --test=cpu --cpu-maxprime=200000 --num-threads=$each run
done

# Testing by creating files (Total 24GB)
sudo sysbench --test=fileio --file-total-size=8G --file-num=3 prepare

# Testing by creating files with an increasing number of threads
for each in 1 4 8 16 32; do 
    sudo sysbench --test=fileio --file-total-size=8G --file-test-mode=rndwr \
    --max-time=240 --max-requests=0 --file-blocksize=4K --file-num=3 --num-threads=$each run
done