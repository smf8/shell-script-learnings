# bash-script-learnings

Just the things is used for practicing shell scripting

- #### add-local-user

  this script reads "Username" "Password" and "Real name" from standard input and creates a local user with it.

  commands used in this script are as listed: 

  - `read` to read from stdin
  - `if else` for condition checking
  - `passwd && chpasswd` for changing and setting user password
  - `useradd` for adding use

- #### lftp & mountftp

  these scripts are my solutions for keeping a folder synced with another folder inside an ftp server. **lftp** uses lftp command and must be used inside a crontab. **mountftp** uses curlftpfs to mount a folder in users Desktop

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

  