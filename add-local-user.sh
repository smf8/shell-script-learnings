#!/bin/bash


#Checking if the user is root user or not by checking it's UID
if [[ ${UID} -ne 0 ]]
then
	echo "This script only works with root privilages"
	exit 1
fi

#Asking for username, password and Full name

read -p "Enter your username : " USERNAME

#Checking if this user is available and redirecting StdErr to /dev/null
id -u ${USERNAME} 2>/dev/null

if [[ ${?} -eq 0 ]]
then
	echo "This username already exists in the system. Please choose another one."
	exit 1
fi

read -s -p "Enter your password: " PASSWORD
echo
read -p "Enter your full name: " USER_FULL_NAME

#Creating a new user with useradd

useradd -c "${USER_FULL_NAME}" -m ${USERNAME}

if [[ ${?} -ne 0 ]]
then
	echo "Failed to create the user. Check inputs and try again"
	exit ${?}
fi

#setting password for user

echo "${USERNAME}:${PASSWORD}" | chpasswd

if [[ ${?} -ne 0 ]]
then
	echo "Failed to set password, choose another one"
	exit ${?}
fi

#Expiring password so in the next login he has to reset it

passwd -e ${USERNAME}

#user creation finished. displaying the desired output

echo "User ${USERNAME} created succesfully with uid $(id -u ${USERNAME})"
echo "Your password is : ${PASSWORD} don't forget to change it on your first login"
echo "The host machine your account was created on is : ${HOSTNAME}"

exit 0
