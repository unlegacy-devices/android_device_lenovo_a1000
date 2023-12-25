## Specify phone tech before including full_phone	
$(call inherit-product, vendor/cm/config/telephony.mk)

# Release name
PRODUCT_RELEASE_NAME := a1000

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product-if-exists, vendor/lenovo/a1000/a1000-vendor-blobs.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device_a1000.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a1000
PRODUCT_NAME := cm_a1000
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := A1000
PRODUCT_MANUFACTURER := lenovo
PRODUCT_CHARACTERISTICS := phone
