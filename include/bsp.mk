.PHONY: bspinfo
bspinfo: 
	@printf "%-30s: %s\n" "modelname" "$(modelname)"
	@printf "%-30s: %s\n" "sdcardrootfs" "$(sdcardrootfs)"
	@printf "%-30s: %s\n" "bsplogo" "$(bsplogo)"
	@printf "%-30s: %s\n" "bspspl" "$(bspspl)"
	@printf "%-30s: %s\n" "bspscripts" "$(bspscripts)"
	@printf "%-30s: %s\n" "kernelimage" "$(kernelimage)"
	@printf "%-30s: %s\n" "bspdtb" "$(bspdtb)"
	@printf "%-30s: %s\n" "bspdtbname" "$(bspdtbname)"

.PHONY: bsp
bsp: bspinfo $(builddir)/.bsp

$(builddir)/.bsp: $(builddir)/.cleanbsp \
	$(builddir)/.prebsp \
	$(builddir)/.bspfolders \
	$(builddir)/.clonebspscripts \
	$(builddir)/.clonebspimage

$(builddir)/.cleanbsp: 
	@rm -rf $(builddir)/$(bspname)

$(builddir)/.prebsp:
	@echo Start to build BSP...

$(builddir)/.bspfolders: 
	@mkdir -p $(builddir)/$(bspname)/{image,scripts}

$(builddir)/.clonebspscripts: 
	@cd $(bspscripts); tar --numeric-owner -zcpf - . | tar -zxpf - -C $(builddir)/$(bspname)/scripts; 

$(builddir)/.clonebspimage: 
	@cp -apf $(bsplogo) $(builddir)/$(bspname)/image
	@cp -apf $(bspspl)/* $(builddir)/$(bspname)/image
	@cp -apf $(u-boot_crc.bin) $(builddir)/$(bspname)/image
	@cp -apf $(u-boot_crc.bin.crc) $(builddir)/$(bspname)/image
	@cp -apf $(bspdtb) $(builddir)/$(bspname)/image/$(bspdtbname)
	@cp -apf $(kernelimage) $(builddir)/$(bspname)/image/zImage
	@cp -apf $(sdcardrootfs) $(builddir)/$(bspname)/image/yocto27.tar.gz
	@echo "$${releaseinfo}" > $(builddir)/$(bspname)/image/version

