#!/bin/bash

# the code is based on the answer given in https://askubuntu.com/questions/758640/how-to-automatically-sync-the-contents-of-a-local-folder-with-the-contents-of-a/758651

# for automation of the script we can use systemd timer as in https://stackoverflow.com/questions/9619362/running-a-cron-every-30-seconds

# reading username and password from stdin if not found

SCRIPT_PATH="`dirname \"$0\"`"
SCRIPT_PATH="$(cd ${SCRIPT_PATH} && pwd)"

#echo ${SCRIPT_PATH}
if ! ls ${SCRIPT_PATH}/cred 2> /dev/null; then
	read -p "Enter your team's username, in format team-###: " CRED[0]
	read -p "Enter your team's password: " CRED[1]
	echo -e "${CRED[0]}\t${CRED[1]}" > ${SCRIPT_PATH}/cred
else
	read -a CRED < ${SCRIPT_PATH}/cred
fi

lftp -f "
open 172.23.134.245 
user ${CRED[0]} ${CRED[1]} 
lcd /home/smf8/Desktop/ftptest 
mirror --reverse --delete --verbose /home/smf8/Desktop/ftptest /files
bye
"

