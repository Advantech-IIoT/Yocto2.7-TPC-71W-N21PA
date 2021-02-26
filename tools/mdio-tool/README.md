# mdio-tool for tpc71w

## How to Compile it

After done to build yocto image, use the command as below to enter the yocto devshell. 

```bash=
$ cd build/yocto/build
# setup bitbake command  environment
$ source setup-environment build.imx6qtpc71wn21pa
$ bitbake adv-base-files -c devshell
# enter this folder again
$ make build
$ cd build
# ex: tpc71w ip address: 192.168.2.83
$ scp mdio-tool root@192.168.2.83:~
$ ssh root@192.168.2.83 ./mdio-tool r eth0 1
```

