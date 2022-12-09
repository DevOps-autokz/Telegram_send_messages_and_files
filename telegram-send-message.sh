#!/bin/bash
### Set script's home location actual for you:
script_home=""

### Telegram API Token should be provided in .env file
# More about API Token check here: https://core.telegram.org/bots/features#botfather
### if .env file does not exist, 
### the script asks user for the Telegram API_TOKEN and inserts it to .env file.
### The .env file will be created with echo command.
if [ -f .env ] ;
    then
	[ -n "$script_home" ] && \
	. "${script_home}"/.env || \
	. .env
    else
	read -p "PLEASE, TYPE TELEGRAM API TOKEN... " "tg_api_token" && \
	echo "tg_api_token=${tg_api_token}" >> "${script_home}/.env"
fi

### On next launch, script will load Telegram API Token (tg_api_token) - from .env file.

### The recepient chat id. Get it with bot: @getidsbot
### Insert it to .env file - if you send messages to only one specific user or chat (Bot-informer, for example),
### otherwise, the script will ask ithe chat id each time.
[ -z "$tg_user_chat_id" ] && \
	read -p "PLEASE, TYPE THE RECEPIENTS CHAT_ID... (you can get it from @getidsbot bot)" "tg_user_chat_id"

### Check if curl is installed:
if ! [ -x "$(command -v curl)" ];
    then
        echo -e \
"\e[41m!!! cURL is not installed !!!\e[0m

\e[94mTo install curl on Ubuntu \e[2m(Debian, Mint etc)\e[0m:
\e[32msudo apt update -y && sudo apt install -y curl\e[0m

\e[94mTo install curl on Redhat \e[2m(CentOS/Alma, Fedora etc)\e[0m:
\e[32msudo dnf install -y curl\e[0m or \e[32msudo yum install -y curl\e[0m

\e[94mTo install curl on Arch \e[2m(Manjaro, EndeavourOS)\e[0m: 
\e[32msudo pacman -Sy curl\e[0m

\e[94mTo install curl on Alpine\e[0m: 
\e[32msudo apk add curl\e[0m

\e[33mInstall curl then rerun this script\e[0m
"
exit 1
fi


### Check if the message was passed as argument ($1).
### If not, request user to type the message:
[[ -n "$1" ]] && message="$1" || \
	read -p "PLEASE, TYPE YOUR MESSAGE:" "message"

### Send the message via Telegram API:
curl -s \
        -X POST \
        https://api.telegram.org/bot${tg_api_token}/sendMessage \
        -d text="${message}" \
        -d chat_id=${tg_user_chat_id} 1>/dev/null
