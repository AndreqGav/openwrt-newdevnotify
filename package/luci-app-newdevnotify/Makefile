include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-newdevnotify
PKG_VERSION:=1.0.1
PKG_RELEASE:=1
PKG_LICENSE:=MIT

LUCI_TITLE:=LuCI Support for New Device Notify
LUCI_DEPENDS:=+newdevnotify
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

define Build/Compile
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
