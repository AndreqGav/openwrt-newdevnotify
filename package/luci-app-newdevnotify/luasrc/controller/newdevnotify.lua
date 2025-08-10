module("luci.controller.newdevnotify", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/newdevnotify") then
        return
    end
    entry({"admin", "services", "newdevnotify"}, cbi("newdevnotify"), _("New Device Notify"), 90).dependent = true
end
