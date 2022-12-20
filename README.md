# Telegram_send_messages_and_files
This script allows to send messages and files (attachments) to Telegram users.

\# Just clone this repo: \
git clone git@github.com:DevOps-autokz/Telegram_send_messages_and_files.git

\# cd to cloned repo and add your own .env file: \
cd Telegram_send_messages_and_files \
touch .env

\### Telegram API Token: https://core.telegram.org/bots/features#botfather \
\# Insert your own Telegram API Token to .env file: \
echo tg_api_token={your_token} >> .env \

\### The recepient's chat id. Get it from bot: @getidsbot
# Fill it in .env file - if you are going send messages to one specific user or chat (Bot-informer etc),
# otherwise, the script will ask ithe chat id each time.
echo tg_user_chat_id={your_token} .env \


\# Usage: \
./telegram-send-message.sh 'message text' \
./telegram-send-file.sh path_to_file
