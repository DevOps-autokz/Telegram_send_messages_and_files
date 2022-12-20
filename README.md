# Telegram_send_messages_and_files
This script allows to send messages and files (attachments) to Telegram users.

\# Just clone this repo: \
git clone git@github.com:DevOps-autokz/Telegram_send_messages_and_files.git

\# cd to cloned repo and add your own .env file: \
cd Telegram_send_messages_and_files \
touch .env

\# Insert your own Telegram API Token to .env file: \
echo tg_api_token={your_token} >> .env \
\# More info about this token: https://core.telegram.org/bots/features#botfather

\# Insert your recepient's 'user_chat_id' to .env file:
echo tg_user_chat_id={your_token}


\# Usage: \
./telegram-send-message.sh 'message text' \
./telegram-send-file.sh path_to_file

sudo ln -s "${HOME}/scripts/Telegram_send_messages_and_files/telegram-send-message.sh" /usr/bin/   \
sudo ln -s "${HOME}/scripts/Telegram_send_messages_and_files/telegram-send-file.sh" /usr/bin/
