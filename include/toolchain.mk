
$(builddir)/.toolchain: 
	@$(call debugcmd,cd $(yoctodir) && source setup-environment $(yoctobuilddir) && bitbake meta-toolchain-qt5,$(@))

.PHONY: toolchain
toolchain: build_meta-toolchain-qt5

