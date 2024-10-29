# Урок 6. Введение в скрипты bash. Планировщики задач crontab и at

## 1. Написать скрипт, который удаляет из текстового файла пустые строки и заменяет маленькие символы на большие. Воспользуйтесь tr или SED.
```console
duckluckbreakout@ubuntuserver:~$ nano task1.sh
```
[![imageup.ru](https://imageup.ru/img102/3640058/screenshot-from-2020-08-10-13-18-29.png)](https://imageup.ru/img102/3640058/screenshot-from-2020-08-10-13-18-29.png.html)
```console
duckluckbreakout@ubuntuserver:~$ ls -l
total 4
-rw-rw-r-- 1 duckluckbreakout duckluckbreakout 70 Aug 10 10:07 task1.s
duckluckbreakout@ubuntuserver:~$ sudo chmod +x task1.sh 
[sudo] password for duckluckbreakout: 
duckluckbreakout@ubuntuserver:~$ ls -l
total 4
-rwxrwxr-x 1 duckluckbreakout duckluckbreakout 70 Aug 10 10:07 task1.sh
```
Файл для тестирования:
[![imageup.ru](https://imageup.ru/img294/3640059/screenshot-from-2020-08-10-13-19-12.png)](https://imageup.ru/img294/3640059/screenshot-from-2020-08-10-13-19-12.png.html)

```console
duckluckbreakout@ubuntuserver:~$ ./task1.sh input_file 
duckluckbreakout@ubuntuserver:~$ ls
input_file  task1.sh
duckluckbreakout@ubuntuserver:~$ cat input_file 
AGSGFASGASGS
G
G 
AFWFAWSFF  FW WG
GWS
```


## 2. Создать однострочный скрипт, который создаст директории для нескольких годов (2010–2017), в них — поддиректории для месяцев (от 01 до 12), и в каждый из них запишет несколько файлов с произвольными записями. Например, 001.txt, содержащий текст «Файл 001», 002.txt с текстом «Файл 002» и т. д.
```console
duckluckbreakout@ubuntuserver:~$ mkdir -p tmp/201{0..7}/{01..12} && for year in {2010..2017}; do for month in {01..12}; do for file_number in {001..003}; do echo "Файл "$file_number > ~/tmp/$year/$month/$file_number.txt; done; done; done
```
## 4. Используя grep, проанализировать файл /var/log/syslog, отобрав события на своё усмотрение.
```console
duckluckbreakout@ubuntuserver:~$ grep "^Aug 10 11" /var/log/syslog
Aug 10 11:11:02 ubuntuserver systemd[1]: session-1.scope: Succeeded.
Aug 10 11:11:44 ubuntuserver systemd[1]: fwupd.service: Succeeded.
Aug 10 11:17:01 ubuntuserver CRON[5291]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Aug 10 11:29:30 ubuntuserver systemd-timesyncd[608]: Timed out waiting for reply from 91.189.89.199:123 (ntp.ubuntu.com).
Aug 10 11:29:30 ubuntuserver systemd-timesyncd[608]: Initial synchronization to time server 91.189.89.198:123 (ntp.ubuntu.com).
```
## 5. Создать разовое задание на перезагрузку операционной системы, используя at.
```console
duckluckbreakout@ubuntuserver:~$ echo '/usr/sbin/reboot -r now' | at 10:00 AM tomorrow
```
