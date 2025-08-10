m = Map("newdevnotify", translate("New Device Notify"),
    translate("Send Telegram alerts when a new device connects to the network."))

s = m:section(NamedSection, "main", "bot", translate("Bot Settings"))

enabled = s:option(Flag, "enabled", translate("Enable"))
enabled.rmempty = false

token = s:option(Value, "token", translate("Bot Token"))
token.datatype = "string"

chat_id = s:option(Value, "chat_id", translate("Chat ID"))
chat_id.datatype = "string"

main_label = s:option(Value, "main_label", translate("Main network label"))
guest_label = s:option(Value, "guest_label", translate("Guest network label"))

btn = s:option(Button, "_reset", translate("Forget all devices"))
btn.inputstyle = "reset"
function btn.write()
    nixio.fs.writefile("/etc/newdevnotify/known_clients.db", "")
end

return m
