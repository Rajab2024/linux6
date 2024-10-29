# Загрузка ОС и процессы
## 1. Потоки ввода/вывода. 
### Создать файл, используя команду echo. 
```console
duckluckbreakout@ubuntuserver:~$ echo lalala > tmp
duckluckbreakout@ubuntuserver:~$ ls
tmp
duckluckbreakout@ubuntuserver:~$ cat tmp
lalala

```
### Используя команду `cat`, прочитать содержимое каталога `etc`, ошибки перенаправить в отдельный файл.
```console
duckluckbreakout@ubuntuserver:~$ cat /etc 2> errors
duckluckbreakout@ubuntuserver:~$ ls
errors  tmp
duckluckbreakout@ubuntuserver:~$ cat errors 
cat: /etc: Is a directory

```
## 2. Конвейер (pipeline). 
### Использовать команду `cut` на вывод длинного списка каталога, чтобы отобразить только права доступа к файлам.
```console
duckluckbreakout@ubuntuserver:~$ ls -l /etc | cut -b 1-10
total 796
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
-rw-r-----
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r-----
-rw-r-----
drwxr-xr-x
-rw-r--r--
-rw-r--r--
-rw-r--r--
-rw-r--r--
-rw-r--r--
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
drwxrwxr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
-rw-r--r--
lrwxrwxrwx
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-r--r--r--
-rw-r--r--
-rw-r--r--
-rw-r--r--
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
lrwxrwxrwx
drwx------
-rw-r--r--
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
lrwxrwxrwx
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
lrwxrwxrwx
lrwxrwxrwx
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
-rw-r-----
-rw-r-----
-rw-r--r--
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
-rw-r--r--
-rw-r--r--
-rw-r--r--
-r--r-----
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
-rw-r--r--
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
drwxr-xr-x
lrwxrwxrwx
-rw-r--r--
-rw-r--r--
drwxr-xr-x
-rw-r--r--
```

### Затем отправить в конвейере этот вывод на sort и uniq, чтобы отфильтровать все повторяющиеся строки.
```console
duckluckbreakout@ubuntuserver:~$ ls -l /etc | cut -b 1-10 | sort | uniq 
-r--r-----
-r--r--r--
-rw-r-----
-rw-r--r--
drwx------
drwxr-xr-x
drwxrwxr-x
lrwxrwxrwx
total 796
```
## 3. Управление процессами. 
### Изменить конфигурационный файл службы `SSH: /etc/ssh/sshd_config`, отключив аутентификацию по паролю `PasswordAuthentication no`.
```console
duckluckbreakout@ubuntuserver:~$ sudo vim /etc/ssh/sshd_config
[sudo] password for duckluckbreakout: 
```
[![imageup.ru](https://imageup.ru/img176/3636389/screenshot-from-2020-07-30-05-05-45.png)](https://imageup.ru/img176/3636389/screenshot-from-2020-07-30-05-05-45.png.html)
### Выполните рестарт службы `systemctl restart sshd (service sshd restart)`, верните аутентификацию по паролю, выполните `reload` службы `systemctl reload sshd (services sshd reload)`. 
```console
duckluckbreakout@ubuntuserver:~$ systemctl restart sshd
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to restart 'ssh.service'.
Authenticating as: duckluckbreakout
Password: 
==== AUTHENTICATION COMPLETE ===
```
```console
duckluckbreakout@ubuntuserver:~$ sudo vim /etc/ssh/sshd_config
```
[![imageup.ru](https://imageup.ru/img150/3636390/screenshot-from-2020-07-30-05-09-09.png)](https://imageup.ru/img150/3636390/screenshot-from-2020-07-30-05-09-09.png.html)
```console
duckluckbreakout@ubuntuserver:~$ systemctl reload sshd
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to reload 'ssh.service'.
Authenticating as: duckluckbreakout
Password: 
==== AUTHENTICATION COMPLETE ===
```

### В чём различие между действиями `restart` и `reload`? 
Restart останавливает службу и заново запускает. 
Reload даёт команду службе перечитать файлы конфигурации без остановки работы.

- restart = stop + start
- reload = продолжить работу + перечитать файлы конфигурации.

### Создайте файл при помощи команды `cat > file_name`, напишите текст и завершите комбинацией `ctrl+d`.
```console
duckluckbreakout@ubuntuserver:~$ cat > file
fasfas
sfasf
fasf
```
### Какой сигнал передадим процессу?
Никакой, т.к. `ctrl+d` это `EOF`

## 4. Сигналы процессам. 
### Запустите mc.
```console
duckluckbreakout@ubuntuserver:~$ mc
```
[![imageup.ru](https://imageup.ru/img76/3636392/screenshot-from-2020-07-30-05-24-53.png)](https://imageup.ru/img76/3636392/screenshot-from-2020-07-30-05-24-53.png.html)
### Используя ps, найдите PID процесса, завершите процесс, передав ему сигнал 9.
```console
duckluckbreakout@ubuntuserver:~$ ps -a
    PID TTY          TIME CMD
  19323 pts/0    00:00:00 mc
  19332 pts/1    00:00:00 ps
```

```console
duckluckbreakout@ubuntuserver:~$ kill -9 19323
```
```console
duckluckbreakout@ubuntuserver:~$ kill -9 19323Killed
```
