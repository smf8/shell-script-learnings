# shell-script-learnings

Just the things used for practicing shell scripting

- #### add-local-user

  This script reads "Username" "Password" and "Real name" from standard input and creates a local user with it.

  commands used in this script are as listed: 

  - `read` to read from stdin
  - `if else` for condition checking
  - `passwd && chpasswd` for changing and setting the user password
  - `useradd` for adding use

- #### lftp & mountftp

  These scripts are my solutions for keeping a folder synced with another folder inside an ftp server. **`lftp.sh`** uses lftp command and must be used inside a crontab. **mountftp** uses curlftpfs to mount a folder in users Desktop

  commands used in this script are as listed

  - `read` to read from stdin
  - `id` command to retrieve user's id and gid
  - saving output of a command in a variable
  - `chown`
  - Detecting the path of the script
  - Checking for file existence 
  - `read` from a file and save it to an array
  - saving a text inside a file with output redirection
  - redirecting stderr

- **add-user-auto-password**

  This script is the 2nd version of user creation scripts. In this script, we get username and comments as command line arguments and provide user with a default generated random password.

  commands used in this script are as listed:

  - `${@}, ${#}, ${NUM}` variables where used for working with positional parameters
  - `date` command for a part of the password
  - `${RANDOM}` for making the password psudo-random
  - `md5sum` for generating a hashed string