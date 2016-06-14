#TODO: Copy resolv.conf

########################################
############## Packages ################
########################################

# Remove SuperSU
SUPERSU := \
	vendor/orion/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
	vendor/orion/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

PRODUCT_COPY_FILES := $(filter-out $(SUPERSU),$(PRODUCT_COPY_FILES))

#Remove GoogleKeyboard
GOOGLE_KEYBOARD := \
   vendor/orion/prebuilt/common/app/GoogleKeyboard/GoogleKeyboard.apk:system/app/GoogleKeyboard/GoogleKeyboard.apk \
   vendor/orion/prebuilt/common/app/GoogleKeyboard/libjni_keyboarddecoder.so:system/lib/libjni_keyboarddecoder.so \
   vendor/orion/prebuilt/common/app/GoogleKeyboard/libjni_unbundled_latinimegoogle.so:/system/lib/libjni_unbundled_latinimegoogle.so

PRODUCT_COPY_FILES := $(filter-out $(GOOGLE_KEYBOARD),$(PRODUCT_COPY_FILES))

# Remove Viper4Android
VIPER := \
   vendor/orion/prebuilt/common/bin/audio_policy.sh:system/audio_policy.sh \
   vendor/orion/prebuilt/common/addon.d/95-LolliViPER.sh:system/addon.d/95-LolliViPER.sh \
   vendor/orion/prebuilt/common/su.d/50viper.sh:system/su.d/50viper.sh \
   vendor/orion/prebuilt/common/app/Viper4Android/Viper4Android.apk:system/priv-app/Viper4Android/Viper4Android.apk

PRODUCT_COPY_FILES := $(filter-out $(VIPER),$(PRODUCT_COPY_FILES))

# Remove Orion's Layers Manager
LAYERS_MANAGER := \
	vendor/orion/prebuilt/common/app/LayersManager/layersmanager.apk:system/app/LayersManager/layersmanager.apk

PRODUCT_COPY_FILES := $(filter-out $(LAYERS_MANAGER),$(PRODUCT_COPY_FILES))

# Add wanted packages
PRODUCT_PACKAGES += \
		LatinIME \
		FDroid \
		Matlog \
		SlimLauncher \
		Snap \
		LayersManager \
		LockClock \
		KernelAdiutor \
		htop \
		Busybox

# Add OnlineNandroid
# NOTE: OnlineNandroid is being named UPDATE-SuperSU.zip to keep build script happy without modifying it
PRODUCT_COPY_FILES += \
		vendor/extra/prebuilt/common/onandroidv9.52.zip:system/addon.d/UPDATE-SuperSU.zip

########################################
############# Settings #################
########################################

# Enable data roaming
PRODUCT_PROPERTY_OVERRIDES := $(subst dataroaming=false,dataroaming=true,$(PRODUCT_PROPERTY_OVERRIDES))

# Disable multiuser
PRODUCT_PROPERTY_OVERRIDES += \
		fw.show_multiuserui=0

# Enable Root for adb and apps
PRODUCT_PROPERTY_OVERRIDES += \
		persist.sys.root_access=3

# Updates overlay settings
PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay/common
