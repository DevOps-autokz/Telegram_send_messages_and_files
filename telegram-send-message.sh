#!/bin/bash
. "${HOME}/scripts/telegram-send/.env"

### Telegram API Token. Info: https://core.telegram.org/bots/features#botfather
# tg_api_token - was sourced from .env file.

### The recepient chat id. Get it with bot: @getidsbot
# tg_user_chat_id - was sourced from .env file.

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
[[ -n "$1" ]] && message="$1" || read -p 'Please, type your message:' "message"

### Send the message via Telegram API:
curl -s \
        -X POST \
        https://api.telegram.org/bot${tg_api_token}/sendMessage \
        -d text="${message}" \
        -d chat_id=${tg_user_chat_id} 1>/dev/null
