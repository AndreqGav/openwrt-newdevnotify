include $(TOPDIR)/rules.mk

PKG_NAME:=newdevnotify
PKG_RELEASE:=1
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/newdevnotify
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Telegram notification on new DHCP client
  DEPENDS:=+curl +libuci +libubox
endef

define Package/newdevnotify/description
Sends Telegram message when a new DHCP client appears; deduplicates by MAC and NETWORK NAME.
endef

define Build/Compile
endef

define Package/newdevnotify/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/newdevnotify $(1)/etc/config/newdevnotify

	$(INSTALL_DIR) $(1)/etc/hotplug.d/dhcp
	$(INSTALL_BIN) ./files/etc/hotplug.d/dhcp/90-newdevnotify $(1)/etc/hotplug.d/dhcp/90-newdevnotify

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/newdevnotify_send.sh $(1)/usr/bin/newdevnotify_send.sh

	$(INSTALL_DIR) $(1)/etc/newdevnotify
	touch $(1)/etc/newdevnotify/known_clients.db
endef

$(eval $(call BuildPackage,newdevnotify))
