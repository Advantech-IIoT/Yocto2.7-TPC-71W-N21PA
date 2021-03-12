
.PHONY: downloadall
downloadall: yocto
	@cd $(yoctodir) && source setup-environment $(yoctobuilddir) && bitbake fsl-image-qt5 --runall=fetch; 

