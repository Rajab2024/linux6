# 1. Управление пользователями:
## a) создать пользователя, используя утилиту useradd
```console
duckluckbreakout@ubuntuserver:~$ sudo useradd -s /bin/bash -d /home/user1 -m user1
[sudo] password for duckluckbreakout: 
duckluckbreakout@ubuntuserver:~$
```
Проверка результата:
```console
duckluckbreakout@ubuntuserver:~$ sed 's/:.*//' /etc/passwd
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data
backup
list
irc
gnats
nobody
systemd-network
systemd-resolve
systemd-timesync
messagebus
syslog
_apt
tss
uuidd
tcpdump
landscape
pollinate
sshd
systemd-coredump
duckluckbreakout
lxd
user1
```
## b) удалить пользователя, используя утилиту userdel
```console
duckluckbreakout@ubuntuserver:~$ killall -9 -u user1
duckluckbreakout@ubuntuserver:~$ sudo userdel --remove user1
userdel: user1 mail spool (/var/mail/user1) not found
```
Проверка результата:
```console
duckluckbreakout@ubuntuserver:~$ sed 's/:.*//' /etc/passwd
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data
backup
list
irc
gnats
nobody
systemd-network
systemd-resolve
systemd-timesync
messagebus
syslog
_apt
tss
uuidd
tcpdump
landscape
pollinate
sshd
systemd-coredump
duckluckbreakout
lxd
```
## c) создать пользователя в ручном режиме
```console
duckluckbreakout@ubuntuserver:~$ sudo mkdir /home/user2
duckluckbreakout@ubuntuserver:~$ sudo vim /etc/passwd
```
[![imageup.ru](https://imageup.ru/img83/3635510/screenshot-from-2020-07-27-13-54-50.png)](https://imageup.ru/img83/3635510/screenshot-from-2020-07-27-13-54-50.png.html)


# 2. Управление группами:
## a) создать группу с использованием утилит и в ручном режиме
```console
duckluckbreakout@ubuntuserver:~$ sudo groupadd group1
duckluckbreakout@ubuntuserver:~$ sudo groupadd group2
```
Проверка результата:
```console
duckluckbreakout@ubuntuserver:~$ sed 's/:.*//' /etc/group
root
daemon
bin
sys
adm
tty
disk
lp
mail
news
uucp
man
proxy
kmem
dialout
fax
voice
cdrom
floppy
tape
sudo
audio
dip
www-data
backup
operator
list
irc
src
gnats
shadow
utmp
video
sasl
plugdev
staff
games
users
nogroup
systemd-journal
systemd-network
systemd-resolve
systemd-timesync
crontab
messagebus
input
kvm
render
syslog
tss
uuidd
tcpdump
ssh
landscape
lxd
systemd-coredump
duckluckbreakout
group1
group2
```

В ручном режиме:
```console
duckluckbreakout@ubuntuserver:~$ sudo vim /etc/group
```
[![imageup.ru](https://imageup.ru/img283/3635521/screenshot-from-2020-07-27-14-15-09.png)](https://imageup.ru/img283/3635521/screenshot-from-2020-07-27-14-15-09.png.html)
## b) попрактиковаться в смене групп у пользователей

Создам пользователя:
```console
duckluckbreakout@ubuntuserver:~$ sudo adduser user4
Adding user `user4' ...
Adding new group `user4' (1004) ...
Adding new user `user4' (1002) with group `user4' ...
Creating home directory `/home/user4' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
No password supplied
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for user4
Enter the new value, or press ENTER for the default
	Full Name []: 
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] y
```
``` console
duckluckbreakout@ubuntuserver:~$ groups user4
user4 : user4
```
``` console
duckluckbreakout@ubuntuserver:~$ sudo usermod -g group1 user4
duckluckbreakout@ubuntuserver:~$ groups user4
user4 : group1
```
``` console
duckluckbreakout@ubuntuserver:~$ sudo vim /etc/group
```
[![imageup.ru](https://imageup.ru/img45/3635524/screenshot-from-2020-07-27-14-24-00.png)](https://imageup.ru/img45/3635524/screenshot-from-2020-07-27-14-24-00.png.html)

[![imageup.ru](https://imageup.ru/img71/3635525/screenshot-from-2020-07-27-14-24-25.png)](https://imageup.ru/img71/3635525/screenshot-from-2020-07-27-14-24-25.png.html)

``` console
duckluckbreakout@ubuntuserver:~$ groups user4
user4 : group1 group3
```
Почему-то пользователь остался в group1, хотя был удален из нее в файле ```/etc/group```

## c) добавить пользователя в группу, не меняя основной
``` console
duckluckbreakout@ubuntuserver:~$ sudo usermod -G group2 user4
duckluckbreakout@ubuntuserver:~$ groups user4
user4 : group1 group2
```
## d) удалить пользователя из группы
``` console
duckluckbreakout@ubuntuserver:~$ sudo deluser user4 group2
Removing user `user4' from group `group2' ...
Done.
duckluckbreakout@ubuntuserver:~$ groups user4
user4 : group1
```

# 3. Создать пользователя с правами суперпользователя. Сделать так, чтобы sudo не требовал пароль для выполнения команд.
``` console
duckluckbreakout@ubuntuserver:~$ sudo useradd -g sudo super_user
duckluckbreakout@ubuntuserver:~$ groups super_user 
super_user : sudo
```
``` console
duckluckbreakout@ubuntuserver:~$ sudo visudo
```
[![imageup.ru](https://imageup.ru/img215/3635533/screenshot-from-2020-07-27-14-44-38.png)](https://imageup.ru/img215/3635533/screenshot-from-2020-07-27-14-44-38.png.html)
