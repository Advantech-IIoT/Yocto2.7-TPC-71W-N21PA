build_%: 
	@make $(builddir)/.$@

build_e_%: 
	@make $(builddir)/.$@

$(builddir)/.build_%:
	@bitbake_target=$$(echo "$$(basename $(@))" | sed -e "s/.build_//"); \
         cd $(yoctodir) && source setup-environment $(yoctobuilddir) && bitbake $${bitbake_target}; 

$(builddir)/.build_e_%:
	@bitbake_target=$$(echo "$$(basename $(@))" | sed -e "s/.build_e_//"); \
         cd $(yoctodir) && source setup-environment $(yoctobuilddir) && bitbake -e $${bitbake_target}; 


