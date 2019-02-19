#!/bin/bash
#Valdemar Duk     02/12/2019
#
#This script creates an interface to turn on or off
# user leds like so "bashled [0-3] [on/off]"
# 
#
gpio0=/sys/class/leds/beaglebone:green:usr0/brightness
gpio1=/sys/class/leds/beaglebone:green:usr1/brightness
gpio2=/sys/class/leds/beaglebone:green:usr2/brightness
gpio3=/sys/class/leds/beaglebone:green:usr3/brightness


if [ "$1" == "0" ]
then
	if [ "$2" == "on" ]
	then
		echo USER LED 0 TURNED ON
		echo 1 > $gpio0
	elif [ "$2" == "off" ]
	then
		echo USER LED 0 TURNED OFF
		echo 0 > $gpio0
	else
		echo invalid entry
	fi
elif [ "$1" == "1" ]
then
	if [ "$2" == "on" ]
        then
                echo USER LED 1 TURNED ON
                echo 1 > $gpio1
        elif [ "$2" == "off" ]
        then
                echo USER LED 1 TURNED OFF
                echo 0 > $gpio1
	else
		echo invalid entry
        fi
elif [ "$1" == "2" ]
then
        if [ "$2" == "on" ]
        then
                echo USER LED 2 TURNED ON
                echo 1 > $gpio2
        elif [ "$2" == "off" ]
        then
                echo USER LED 1 TURNED OFF
                echo 0 > $gpio2
        else
                echo invalid entry
        fi
elif [ "$1" == "3" ]
then
        if [ "$2" == "on" ]
        then
                echo USER LED 3 TURNED ON
                echo 1 > $gpio3
        elif [ "$2" == "off" ]
        then
                echo USER LED 3 TURNED OFF
                echo 0 > $gpio3
        else
                echo invalid entry
        fi
else
	echo invalid entry
fi


