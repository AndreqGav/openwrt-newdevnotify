# openwrt-newdevnotify
Sends Telegram message when a new DHCP client appears; deduplicates by MAC and NETWORK NAME.

Для настройки необходимо создать своего бота в телеграмм и указать его токен и идентификатор чат с вами в конфигурации:

1. Создайте бота в телеграмме через @BotFather

2. Начните диалог с ботом

3. Узнайте идентификатор чата (в личном сообщение chat id = ваш идентификатор)

	Можно узанть отправив запрос GET https://api.telegram.org/bot{{notify_bot_token}}/getUpdates и в нем будет chat.id с вами

4. Установить параметры token, chat_id в /etc/config/newdevnotify или используйте плагин luci-app-newdevnotify и через LuCI сделайте это (Services->New Device Notify)