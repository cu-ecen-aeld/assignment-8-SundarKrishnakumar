################################################################################
#
# LDD
#
################################################################################

#TODO: Fill up the contents below in order to reference your assignment 7 git contents
#Reference: https://stackoverflow.com/questions/24750215/getting-the-last-commit-hash-from-a-remote-repo-without-cloning/24750310
#			https://stackoverflow.com/questions/468370/a-regex-to-match-a-sha1
LDD_VERSION = $(shell git ls-remote \
	https://github.com/cu-ecen-aeld/assignment-7-SundarKrishnakumar.git HEAD | \
	grep -o -E  "[0-9a-f]{40}")

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'https://github.com/cu-ecen-aeld/assignment-7-SundarKrishnakumar.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
	
endef

LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)



$(eval $(kernel-module))
$(eval $(generic-package))
