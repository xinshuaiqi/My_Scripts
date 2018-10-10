# 使一个script在哪里都能执行
1） chmod u+x XXX
2) add #!/usr/bin/python3
3) add export PATH="YOUR_PATH_WITHOUT_TRAILING_SLASH:$PATH" to .profile at your home directory;
then source .profile
















E:\mega\__编程 生信 统计\Linux
@Linux与Unix shell编程指南（完整高清版）.pdf

# loop
for ((i=1; i<11; i=i+1))
do
<linux cmd> >qxs-Bam-Merge.log 2>&1
done

(time sleep 2s) >time.log 2>&1

# Date format
d=$(date +"%F-%H%M")
2018-05-24-1919



#改密码
passwd

# qixinshuai



#查看cpu数
 lscpu
nproc

# chmod
c h m o d命令的一般格式为：
chmod [who] operator [permission] filename
w h o的含义是：
u 文件属主权限。
g 同组用户权限。
o 其他用户权限。
a 所有用户(文件属主、同组用户及其他用户)。
o p e r a t o r的含义：
+ 增加权限。
- 取消权限。
= 设定权限。
permission的含义：
r 读权限。
w 写权限。
x 执行权限。
s 文件属主和组s e t - I D。
t 粘性位*。
l 给文件加锁，使其他用户无法访问。

chmod 666 rw- rw- rw- 赋予所有用户读和写的权限
chmod 644 rw- r-- r- - 赋予所有文件属主读和写的权限，所有其他用户读权限
chmod 744 rwx r-- r- - 赋予文件属主读、写和执行的权限，所有其他用户读的权限
chmod 664 rw- rw- r- - 赋予文件属主和同组用户读和写的权限，其他用户读权限
chmod 700 rwx --- --- 赋予文件属主读、写和执行的权限
chmod 444 r-- r-- r- - 赋予所有用户读权限
chmod 777
chmod 755 rwx rx rx 

# find 
find ./ -name "*.py"
find . -perm 755 # find permission with 755 

find / -mtime -5 # modified time past 5 days
find ./ -name "*.py" |xargs file # then list file type 



# crantabl

# at

# & 后台

# nohup # not hang up  退出账号后继续运行
写几个命令 存在sh里
nohup ./myshell.sh > outfile.txt &




qxs@qxs-X1:~/Ubuntu$ read name
xishuai              
qxs@qxs-X1:~/Ubuntu$ echo $name
xishuai  


# tee 既打印 又保存结果
ls | tee ls.out 

# 把标准输出和标准错误一起重定向到一个文件中
command > filename 2>&1 

# 把c o m m a n d命令以f i l e n a m e文件作为标准输入，以f i l e n a m e 2文件
# 作为标准输出
command < filename >filename2 

command < filename # 把c o m m a n d命令以f i l e n a m e文件作为标准输入

command >&m # 把把标准输出重定向到文件描述符m中
command <&- # 把关闭标准输入

# 如果这个命令执行成功& &那么执行这个命令
&&
# 如果这个命令执行失败了|| 那么就执行这个命令
|| 


# grep 
常用的g r e p选项有：
-c 只输出匹配行的计数。
-i 不区分大小写（只适用于单字符）。
-h 查询多文件时不显示文件名。
-l 查询多文件时只输出包含匹配字符的文件名。
-n 显示匹配行及行号。
-s 不显示不存在或无匹配文本的错误信息。
-v 显示不包含匹配文本的所有行。

# grep empty line
grep "^$"


# egrep
# egrep everything from a file
egrep -f filename data.txt


# AWK


# vim 
0  移到文章的开头















#查看cpu 使用率
mpstat


packrat: 16 存储结果
hyrax: 64 用于计算
ratel: 48 现在有问题

# 查看内存
free -m
it shows total memory, used memory, free memory in megabytes. 

#查看硬盘使用
cd 到目的目录
du -msh


#command return with present working directory.
pwd 

# who is online
w

#current amount of free space on your disk drives
df

#查看版本信息
cat /etc/lsb-release

系统
# uname -a               # 查看内核/操作系统/CPU信息
# head -n 1 /etc/issue   # 查看操作系统版本
# cat /proc/cpuinfo      # 查看CPU信息
# hostname               # 查看计算机名
# lspci -tv              # 列出所有PCI设备
# lsusb -tv              # 列出所有USB设备
# lsmod                  # 列出加载的内核模块
# env                    # 查看环境变量
资源
# free -m                # 查看内存使用量和交换区使用量
# df -h                  # 查看各分区使用情况
# du -sh <目录名>        # 查看指定目录的大小
# grep MemTotal /proc/meminfo   # 查看内存总量
# grep MemFree /proc/meminfo    # 查看空闲内存量
# uptime                 # 查看系统运行时间、用户数、负载
# cat /proc/loadavg      # 查看系统负载
磁盘和分区
# mount | column -t      # 查看挂接的分区状态
# fdisk -l               # 查看所有分区
# swapon -s              # 查看所有交换分区
# hdparm -i /dev/hda     # 查看磁盘参数(仅适用于IDE设备)
# dmesg | grep IDE       # 查看启动时IDE设备检测状况
网络
# ifconfig               # 查看所有网络接口的属性
# iptables -L            # 查看防火墙设置
# route -n               # 查看路由表
# netstat -lntp          # 查看所有监听端口
# netstat -antp          # 查看所有已经建立的连接
# netstat -s             # 查看网络统计信息
进程
# ps -ef                 # 查看所有进程
# top                    # 实时显示进程状态
用户
# w                      # 查看活动用户
# id <用户名>            # 查看指定用户信息
# last                   # 查看用户登录日志
# cut -d: -f1 /etc/passwd   # 查看系统所有用户
# cut -d: -f1 /etc/group    # 查看系统所有组
# crontab -l             # 查看当前用户的计划任务
服务
# chkconfig --list       # 列出所有系统服务
# chkconfig --list | grep on    # 列出所有启动的系统服务
程序
# rpm -qa                # 查看所有安装的软件包
------------------------------------
#screen
byobu

Putty 設定

需然打開了在 Putty 打開了 Byobu 但 F2至F4不能運作，所以在Putty上要設定一下。
在Putty的設定頁 "Terminal" -> "Keyboard" -> "The Function keys and keypad" 選用 "Xterm R6" 便可。



./  # 当前目录
~/  # home directory

移动当前文件夹下的所有文件到上一级目录
mv * ../

cp -r ./tt/ttt/ ./ # -r 代表拷贝这里面所有的东西 包括子文件夹
# 当前目录 ./表示
cp -r * /home/bblarsen/ /home/qixinshuai/bblarsen/
scp F:\BioPerl-1.6.0.tar.gz qixinshuai@hyrax.arl.arizona.edu: ./perl
scp F:\Mtruncatula_285_Mt4.0v1.cds_primaryTranscriptOnly.gz qixinshuai@ratel.arl.arizona.edu: /home




