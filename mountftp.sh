#!/bin/bash


# check if the user is root

if [[ ${UID} -ne 0 ]]
then
	echo "you must execute this script with root. use \"sudo ./mountftp.sh\""
	exit 1
fi

# reading username and password from stdin
read -p "Enter your team's username, in format team-###: " USERNAME
read -p "Enter your team's password: " PASSWORD

# connecting to ftp server and mounting FTP folder

# creating ftp folder if not exists

FTPDIR="${HOME}/Desktop/ftp"

mkdir -p ${FTPDIR}

USER=$(id -un)
GROUP=$(id -gn)

chown "${USER}:${GROUP}" ${FTPDIR}

curlftpfs 172.23.134.245 ${FTPDIR} -o user="${USERNAME}:${PASSWORD},allow_other"


