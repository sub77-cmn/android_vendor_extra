#TODO: Copy resolv.conf

########################################
############## Packages ################
########################################

# Remove Chromium and DUCertified
#REMOVE_PACKAGES := CyanogenSetupWizard
#REMOVE_PACKAGES += TeleService Telecom TelephonyProvider

#PRODUCT_PACKAGES := $(filter-out $(REMOVE_PACKAGES),$(PRODUCT_PACKAGES))

# Add wanted packages
#PRODUCT_PACKAGES += \

########################################
############# Settings #################
########################################

# Disable SELinux
#PRODUCT_PROPERTY_OVERRIDES := $(subst selinux=1,selinux=0,$(PRODUCT_PROPERTY_OVERRIDES))

# Enable data roaming
#PRODUCT_PROPERTY_OVERRIDES := $(subst dataroaming=false,dataroaming=true,$(PRODUCT_PROPERTY_OVERRIDES))

# Disable multiuser
#PRODUCT_PROPERTY_OVERRIDES += fw.show_multiuserui=0

# Updates overlay settings
#PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay/common

# Enable Root for adb and apps
PRODUCT_PROPERTY_OVERRIDES += persist.sys.root_access=3
