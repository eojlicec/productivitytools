# ut  Description -- Date 26 Apr 2019 #

Untar a number of files in a single keyword when present in the same directory

Working with larger datasets & packet captures leads me to a do a lot of data compression and extraction. Specifically I end up untaring a number of file specially working with streamed realtime data.  

I end up running the below for each data that is compressed and  collected.

### *Session Logs*

```console
[eojlicec@raspberrypi tmp]$ pwd
/usr/local/program/data/tmp
[eojlicec@raspberrypi tmp]$ ls -lhrt *tar.gz
-rw-rw----+ 1 eojlicec Domain Users 30M Apr 26 15:34 server1_20190425-163058_support.tar.gz
-rw-rw----+ 1 eojlicec Domain Users 62M Apr 26 15:34 server2_20190425-162749_support.tar.gz
-rw-rw----+ 1 eojlicec Domain Users 34M Apr 26 15:34 server3_20190425-162539_support.tar.gz
[eojlicec@raspberrypi tmp]$ mkdir server1_20190425-163058_support
[eojlicec@raspberrypi tmp]$ ls -lhrt 
-rw-rw----+ 1 eojlicec Domain Users 30M Apr 26 15:34 server1_20190425-163058_support.tar.gz
-rw-rw----+ 1 eojlicec Domain Users 62M Apr 26 15:34 server2_20190425-162749_support.tar.gz
-rw-rw----+ 1 eojlicec Domain Users 34M Apr 26 15:34 server3_20190425-162539_support.tar.gz
drwxrws---+ 6 eojlicec Domain Users   6 Apr 26 15:42 server1_20190425-163058_support
[eojlicec@raspberrypi tmp]$ tar -xvf server1_20190425-163058_support.tar.gz -C server1_20190425-163058_support
<sniped decompression messages>
.
.
.
<End of decompressed messages>
[eojlicec@raspberrypi tmp]$
```
 
Using the simple bash script along with an alias in /home/eojlicec/.bashrc the whole steps can be made achieved in one stroke.

```console
[eojlicec@raspberrypi tmp]$ cat /home/eojlicec/.bashrc | grep ut.sh 
alias ut="/home/jcecil/tools/ut.sh"
[eojlicec@raspberrypi tmp]$
```

 Add the below bash line script in /home/jcecil/tools/ut.sh

```console
for i in `ls`; do mkdir `echo $i | rev | cut -d'.' -f3,4,5,6,7 | rev`; tar -xvf  $i -C `echo $i | rev | cut -d'.' -f3,4,5,6,7,8,9,10 | rev` ; done
```

##### Note: First time you might have to create the directory tools under your username.
