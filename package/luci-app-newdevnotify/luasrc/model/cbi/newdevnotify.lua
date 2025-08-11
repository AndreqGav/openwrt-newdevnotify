local uci = require "luci.model.uci".cursor()
local db_path = uci:get("newdevnotify", "main", "db_path") or ""

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

template = s:option(TextValue, "template", translate("Message template for notification"))
template.rows = 8
template.wrap = "off"
template.rmempty = true
template.description = translate("Use variables: $NETNAME, $DATE, $HOST, $MAC, $IP.")

function template.cfgvalue(self, section)
    local val = self.map.uci:get("newdevnotify", section, "template")
    if val then
        val = val:gsub("\\n", "\n")
    end
    return val
end

function template.write(self, section, value)
    if value then
        value = value:gsub("\r\n?", "\n")
        value = value:gsub("\n", "\\n")
    end
    self.map.uci:set("newdevnotify", section, "template", value)
end

btn = s:option(Button, "_reset", translate("Forget all devices"))
btn.inputstyle = "reset"
function btn.write()
    nixio.fs.writefile(db_path, "")
end

db = s:option(TextValue, "_known_clients", translate("Known clients database"))
db.rows = 15
db.wrap = "off"
db.readonly = true

function db.cfgvalue(self, section)
    return nixio.fs.readfile(db_path) or ""
end

return m
