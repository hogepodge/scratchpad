### Benchmarks run on ubuntu 20.04

sudo apt install iperf3 sysstat -y

# iperf testing from master
git clone https://github.com/Pharb/kubernetes-iperf3.git
cd kubernetes-iperf3
./iperf3.sh -t 100 

# cpu measurements from all nodes
mpstat 2 10000

