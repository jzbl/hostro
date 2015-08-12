# hostro




#### Description

Prevent my Dell Vostro from overheating. It is/was a hot summer, my laptop is quite old and
the Dell BIOS isn't a masterpiece either...

It is a simple script, stupid as it is, it is just running every minute via crontab.  

It triggers full fan via "i8kfan 2 2" once both cores reach defined threshold combined.
Goes down to medium "i8kfan 1 1" once it is below.
Tested on Fedora 22 and 3350, dual core model (script is hard coded for 2 cores).


#### Requirements:

- i8kutils
- lm_sensors


#### Example usage:

Edit crontab to match your path:
```
*/1 * * * * /usr/local/bin/hostro.sh 2>&1 1>/tmp/hostro.log
```


#### View logs

```
$ cat /tmp/hostro.log 
[hostro] CPU temp: C0: 56, C1: 57, COMB: 113, FAN: medium
```


#### License & Legal

Dell and the Dell logo are trademarks of Dell Computer Corporation. The author is not affiliated with Dell in any way.
Script is released under:

[MIT](https://www.tldrlegal.com/l/mit)


