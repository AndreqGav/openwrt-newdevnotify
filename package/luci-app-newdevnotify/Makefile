include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-newdevnotify
PKG_RELEASE:=1
PKG_LICENSE:=MIT

LUCI_TITLE:=LuCI Support for New Device Notify
LUCI_DEPENDS:=+newdevnotify

include $(TOPDIR)/feeds/luci/luci.mk

define Build/Compile
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
