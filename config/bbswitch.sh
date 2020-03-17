#!/bin/bash

if [ "${1}" == "pre" ]
then
	rmmod bbswitch
elif [ "${1}" == "post" ]
then
	modprobe bbswitch load_state=0
fi

