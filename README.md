# ut (Untar) Tool Description #

* V1. Untar a number of files in a single keyword when present in the same directory. [Date 25 April 2019]
* V2. Untar a single file by passing as an arguement. [Date 26 April 2019]

Working with larger datasets & packet captures leads me to a do a lot of data compression and extraction. Specifically I end up untaring a number of file specially working with streamed realtime data. I end up running the below for each data that is compressed and  collected.

### *Session Logs*

```console
root@raspberrypi:/usr/local/program/ut/test# pwd
/usr/local/program/ut/test
root@raspberrypi:/usr/local/program/ut/test# ls -lhrt
total 8.0K
-rw-r--r-- 1 root staff 116 Apr 26 20:32 2.b.bb.bbb.tar.gz
-rw-r--r-- 1 root staff 116 Apr 26 20:32 1.a.aa.aaa.tar.gz
root@raspberrypi:/usr/local/program/ut/test#
root@raspberrypi:/usr/local/program/ut/test# mkdir 1.a.aa.aaa
root@raspberrypi:/usr/local/program/ut/test# tar -xvf 1.a.aa.aaa.tar.gz -C 1.a.aa.aaa
1.txt
root@raspberrypi:/usr/local/program/ut/test# mkdir 2.b.bb.bbb
root@raspberrypi:/usr/local/program/ut/test# tar -xvf 2.b.bb.bbb.tar.gz -C 2.b.bb.bbb
2.txt
root@raspberrypi:/usr/local/program/ut/test#
```

Using the simple bash script along with an alias in /home/pi/.bashrc the whole steps can be made achieved in one stroke. Helps me reduce the time consumed for 30s to 3s which is a 90% reduction.

```console
root@raspberrypi:/usr/local/program/ut/test# cat /home/pi/.bashrc | grep ut.sh
alias ut="/home/pi/tools/ut.sh"
root@raspberrypi:/usr/local/program/ut/test#
```

Place the attached ut.sh line script to /home/pi/tools/ut.sh of the Linux server.

##### Note: First time you might have to create the directory tools under your username.


### Usage Example Extract single file.

```console
root@raspberrypi:/usr/local/program/ut/test# ut 1.a.aa.aaa.tar.gz
Extracting the input file  1.a.aa.aaa.tar.gz
1.txt
root@raspberrypi:/usr/local/program/ut/test#
```

### Usage Example Extract all files.

```console
root@raspberrypi:/usr/local/program/ut/test# ut
Extracting all tar.gz files
1.txt
2.txt
root@raspberrypi:/usr/local/program/ut/test#  ls -lhrt
total 16K
-rw-r--r-- 1 root staff  116 Apr 26 20:32 2.b.bb.bbb.tar.gz
-rw-r--r-- 1 root staff  116 Apr 26 20:32 1.a.aa.aaa.tar.gz
drwxr-sr-x 2 root staff 4.0K Apr 26 21:29 1.a.aa.aaa
drwxr-sr-x 2 root staff 4.0K Apr 26 21:29 2.b.bb.bbb
root@raspberrypi:/usr/local/program/ut/test#
```
