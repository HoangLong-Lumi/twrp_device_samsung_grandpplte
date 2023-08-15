MKBOOTIMG := device/samsung/grandpplte/mkbootimg

FLASH_IMAGE_TARGET ?= $(PRODUCT_OUT)/recovery.tar

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel) $(RECOVERYIMAGE_EXTRA_DEPS)
	@echo "----- Making recovery image ------"
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(INTERNAL_MKBOOTIMG_VERSION_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo "----- Lying about SEAndroid state to Samsung bootloader ------"
	$(hide) echo -n "SEANDROIDENFORCE" >> $@
	@echo "Made recovery image: $@"
	$(hide) tar -C $(PRODUCT_OUT) -c recovery.img > $(FLASH_IMAGE_TARGET)
	@echo "Made flashable $(FLASH_IMAGE_TARGET): $@"
