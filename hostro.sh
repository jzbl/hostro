#!/usr/bin/bash
# Description: Prevents Dell Vostro from running too hot
# Author: jzbl
# version 0.0.1a - 2015-08-12
# - initial version
# "hic sunt dragones"

# temp max is around 85C, we want a quick cool down when combined
# core C0+C1 temp is around 130C
# unfortunatelly that doesn't trigger to max due to faulty Dell BIOS
# I have 2 core CPU so adjusted the script for my Vostro 3350 
# requires : i8kutils and lm_sensors

HSENSORS=/usr/bin/sensors
HI8KFAN=/usr/bin/i8kfan

HCPU_TEMP=$($HSENSORS | awk '{  if ( $1 == "Core" ) print $3; }' | awk -F'[^0-9]*' '$0=$2')
HCORE0=$(echo $HCPU_TEMP | awk '{ print $1 }')
HCORE1=$(echo $HCPU_TEMP | awk '{ print $2 }')
HCOMB=$(echo $HCORE0 + $HCORE1 | bc)
HFANSPEED="debugnone"

if [ "$HCOMB" -gt 125 ]; then
	$HI8KFAN 2 2 2>&1 1>/dev/null
	HFANSPEED="high"
else
	$HI8KFAN 1 1 2>&1 1>/dev/null
	HFANSPEED="medium"
fi

echo "[hostro] CPU temp: C0: $HCORE0, C1: $HCORE1, COMB: $HCOMB, FAN: $HFANSPEED"
