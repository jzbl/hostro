# hostro




#### Description

Prevent my Dell Vostro from overheating
A simple script, stupid as it is, just running every minute in crontab.  

It triggers full fan via "i8kfan 2 2" once both cores reach 130 combined.
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


#### License
[MIT](https://www.tldrlegal.com/l/mit)


