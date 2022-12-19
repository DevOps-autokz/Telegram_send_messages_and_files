#!/bin/bash
### Telegram API Token should be provided in .env file
# More info about API Token is here: https://core.telegram.org/bots/features#botfather
### if .env file does not exist, 
### the script asks user for the Telegram API_TOKEN and inserts it to .env file.
### On next launch, script will load Telegram API Token (tg_api_token) - from .env file.
if [ -f .env ] ;
    then
	. .env
    else
	read -p "PLEASE, TYPE TELEGRAM API TOKEN... " "tg_api_token" && \
	echo "tg_api_token=${tg_api_token}" >> .env
fi

### The recepient's chat id. Get it from bot: @getidsbot
### Fill it in .env file - if you are going send messages to one specific user or chat (Bot-informer etc),
### otherwise, the script will ask ithe chat id each time.
[ -z "$tg_user_chat_id" ] && \
	read -p "PLEASE, TYPE THE RECEPIENTS CHAT_ID... (you can get it from @getidsbot bot) " "tg_user_chat_id"

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

### Check if the file-path was passed as argument ($1).
### If not, request user to type the path to attachment file:
[[ -n "$@" ]] && attachment="$@" || read -p $"Please, type full path to file ( ~ is not accepted): " "attachment"

### Send file (attachment) via Telegram API:
curl -s \
	-m 20 -F "chat_id=${tg_user_chat_id}" \
	-F document=@"${attachment}" \
	https://api.telegram.org/bot${tg_api_token}/sendDocument 1>/dev/null
