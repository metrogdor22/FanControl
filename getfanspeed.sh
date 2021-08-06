#!/bin/bash

HOST=192.168.0.12
USER=root
PASS=calvin

ipmitool -I lanplus -H $HOST -U $USER -P $PASS sensor reading Fan1 Fan2 Fan3  Fan4  Fan5  Fan6
