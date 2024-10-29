# 1. Навигация по файловой системе. 

## Попрактиковаться в перемещении между каталогами, используя полный и относительный путь.
```console
duckluckbreakout@ubuntuserver:~$ cd tmp1
duckluckbreakout@ubuntuserver:~/tmp1$
```
```console
duckluckbreakout@ubuntuserver:~/tmp1$ cd tmp2/tmp\ 3
duckluckbreakout@ubuntuserver:~/tmp1/tmp2/tmp 3$
```
```console
duckluckbreakout@ubuntuserver:~/tmp1/tmp2/tmp 3$ cd ../../tmp2_1
duckluckbreakout@ubuntuserver:~/tmp1/tmp2_1$
```
```console
duckluckbreakout@ubuntuserver:~/tmp1/tmp2_1$ cd ~
duckluckbreakout@ubuntuserver:~$
```
```console
duckluckbreakout@ubuntuserver:~/tmp1/tmp2_1$ cd ~
duckluckbreakout@ubuntuserver:~$ cd ..
duckluckbreakout@ubuntuserver:/home$ cd /home/duckluckbreakout/tmp1/tmp2
duckluckbreakout@ubuntuserver:~/tmp1/tmp2$ cd /home/duckluckbreakout/tmp1/tmp2
```

## Перечислить, какие параметры команды cd позволят быстро вернуться в домашний каталог, позволят перейти на уровень выше.
### быстро вернуться в домашний каталог
```console
duckluckbreakout@ubuntuserver:~/tmp1/tmp2_1$ cd ~
duckluckbreakout@ubuntuserver:~$
```
### позволят перейти на уровень выше.
```console
duckluckbreakout@ubuntuserver:~/tmp1/tmp2/tmp 3$ cd ..
duckluckbreakout@ubuntuserver:~/tmp1/tmp2$
```

# 2. Управление файлами и каталогами и текстовые редакторы. 
## Создать файл с наполнением, используя несколько способов. 
```console
duckluckbreakout@ubuntuserver:~/tmp1$ cat>file1
asd
qwe
^C
duckluckbreakout@ubuntuserver:~/tmp1$ cat file1
asd
qwe
```
```console
duckluckbreakout@ubuntuserver:~/tmp1$ echo asf wqe as dfa > file2
duckluckbreakout@ubuntuserver:~/tmp1$ cat file2
asf wqe as dfa
```
```console
duckluckbreakout@ubuntuserver:~/tmp1$ echo "lalala lalal" > file3
duckluckbreakout@ubuntuserver:~/tmp1$ cat file3
lalala lalal
```

## Использовать разобранные текстовые редакторы для наполнения файлов данными. 

### nano
```console
duckluckbreakout@ubuntuserver:~/tmp1$ nano file4
```
[![imageup.ru](https://imageup.ru/img200/3634267/snimok-ehkrana-2020-07-23-v-142846.jpg)](https://imageup.ru/img200/3634267/snimok-ehkrana-2020-07-23-v-142846.jpg.html)
```console
duckluckbreakout@ubuntuserver:~/tmp1$ cat file4
asffffwf
faafssfa
gasg
asg
waw

```

### vim
```console
duckluckbreakout@ubuntuserver:~/tmp1$ vim file5
```
[![imageup.ru](https://imageup.ru/img152/3634269/snimok-ehkrana-2020-07-23-v-143305.jpg)](https://imageup.ru/img152/3634269/snimok-ehkrana-2020-07-23-v-143305.jpg.html)
```console
duckluckbreakout@ubuntuserver:~/tmp1$ cat file4
lala
fasf
wr
```

## Создать копии созданных файлов, создать несколько каталогов с подкаталогами, перенести несколько файлов в созданные каталоги. 
```console
duckluckbreakout@ubuntuserver:~/tmp1$ cp file4 file4_copy
duckluckbreakout@ubuntuserver:~/tmp1$ cp file5 file5_copy
```
```console
duckluckbreakout@ubuntuserver:~/tmp1$ mkdir -p tmp3/tmp4
duckluckbreakout@ubuntuserver:~/tmp1$ mkdir /tmp/tmp5
```
```console
duckluckbreakout@ubuntuserver:~/tmp1$ mv file4_copy tmp3/tmp4
duckluckbreakout@ubuntuserver:~/tmp1$ ls tmp3/tmp4
file4_copy
duckluckbreakout@ubuntuserver:~/tmp1$ mv file5_copy /tmp/tmp5
duckluckbreakout@ubuntuserver:~/tmp1$ ls /tmp/tmp5
file5_copy
```
