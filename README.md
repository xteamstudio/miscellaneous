# miscellaneous
bla bla bla

# crontab
```
0 10 * * 1-5 sh notify.sh 1 >/dev/null 2>&1
30 16 * * 1,2,4,5 sh notify.sh 2 >/dev/null 2>&1
30 17 * * 3 sh notify.sh 2 >/dev/null 2>&1
30 18 * * 1,2,4,5 sh notify.sh 2 >/dev/null 2>&1
```
