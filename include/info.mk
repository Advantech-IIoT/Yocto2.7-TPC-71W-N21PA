.PHONY: info
info: 
	@printf "\n"
	@printf "%-30s: %s\n" "currdir" "$(currdir)"
	@printf "%-30s: %s\n" "builddir" "$(builddir)"
	@printf "%-30s: %s\n" "repobin" "$(repobin)"
	@printf "%-30s: %s\n" "yoctodir" "$(yoctodir)"
	@printf "%-30s: %s\n" "yoctomanifest" "$(yoctomanifest)"
#	@[ x"$(gitserver)" != "x" ] && printf "%-30s: %s\n" "gitserver" "$(gitserver)" || echo "no gitserver!!"
	@printf "images: \n"
#	@printf "%-30s: %s\n" "YOCTO_WORK_DIR_CHK" "$(YOCTO_WORK_DIR_CHK)"
#	@printf "%-30s: %s\n" "sdcardimage" "$(sdcardimage)"
	@printf "%-30s: %s\n" "$(sdcardimage)" "$($(sdcardimage))"
	@printf "%-30s: %s\n" "u-boot_crc.bin" "$(u-boot_crc.bin)"
	@printf "%-30s: %s\n" "u-boot_crc.bin.crc" "$(u-boot_crc.bin.crc)"
	@printf "%-30s: %s\n" "sdcardrootfs" "$(sdcardrootfs)"
