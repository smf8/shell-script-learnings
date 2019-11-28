#!/bin/bash


#Checking if the user is root user or not by checking it's UID
if [[ ${UID} -ne 0 ]]
then
	echo "This script only works with root privilages"
	exit 1
	fi

#Instead of prompting user for inserting username we just get username and comments as parameters

#If no parameter is provided, we display a help message to the screen

if [[ ${#} -lt 1 ]]
then
	echo "script usage: ${0} \"USERNAME\" [COMMENTS...]"
	exit 1
	fi

#1st parameter as username
USERNAME=${1}

#shifting parameters by 1 and considering all the other parameters as comment
shift
COMMENT="${@}"

#Generating a random password for the user based on current time in nano
#It's not so easy to concat output of two commands into a single text without any trouble in shell
#But the below solution works just fine

PASSWORD=$(date +%s%N${RANDOM} | md5sum | head -c32)

#Let's just go and create our user

useradd -c "${COMMENT}" -p ${PASSWORD} -m ${USERNAME}

if [[ ${?} -eq 0 ]]
then
	echo "User ${USERNAME} with password ${PASSWORD} has been created succesfully"
	exit 0
	fi

