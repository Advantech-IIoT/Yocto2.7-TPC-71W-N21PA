currdir=$(shell pwd)
builddir=${currdir}/build
scriptsdir=${currdir}/scripts
SHELL=/bin/bash
yoctodir=$(builddir)/yocto
yoctomanifest=local.xml
yoctomachine=imx6qtpc71wn21pa
yoctobuilddir=build.$(yoctomachine)
yoctodistro=fsl-imx-x11

# YOCTO_WORK_DIR_CHK=$(shell if [ -f "$(yoctodir)/$(yoctobuilddir)/conf/extra-local.conf" ] ; then eval $$(cat /work/wise710a1/yocto-2.7/build/yocto/build.imx6dlwise710a1/conf/extra-local.conf | grep DL_DIR) ; echo $$DL_DIR | sed -e 's/\/downloads$$//'; fi)
# ifneq ($(YOCTO_WORK_DIR_CHK),)
# yoctoworkdir=$(YOCTO_WORK_DIR_CHK)
# else
# yoctoworkdir=$(yoctodir)/$(yoctobuilddir)
# endif

YOCTO_WORK_DIR:=$(builddir)/workdir
define extra_local_conf_str
DL_DIR = "$(YOCTO_WORK_DIR)/downloads"
TMPDIR = "$(YOCTO_WORK_DIR)/tmp"
SSTATE_DIR = "$(YOCTO_WORK_DIR)/sstate-cache"
CORE_IMAGE_EXTRA_INSTALL += " adv-base-files kernel-modules "
EXTRA_IMAGE_FEATURES += " package-management "
DISTRO_FEATURES_remove = " optee "
FEATURE_INSTALL_remove=" psplash "
UBOOT_CONFIG += "1G"
SCMVERSION = "n"
endef 
export extra_local_conf_str

YOCTO_WORK_DIR_CHK=$(shell if [ -f "$(yoctodir)/$(yoctobuilddir)/conf/extra-local.conf" ] ; then eval $$(cat $(yoctodir)/$(yoctobuilddir)/conf/extra-local.conf | grep -s DL_DIR | sed "s/ *= */=/") ; echo $$DL_DIR | sed -e 's/\/downloads$$//'; fi)
ifneq ($(YOCTO_WORK_DIR_CHK),)
yoctoworkdir=$(YOCTO_WORK_DIR_CHK)
else
yoctoworkdir=$(yoctodir)/$(yoctobuilddir)
endif

fsl-image-qt5=$(shell realpath -m $(yoctoworkdir)/tmp/deploy/images/$(yoctomachine)/fsl-image-qt5-$(yoctomachine).sdcard)
core-image-full-cmdline=$(shell realpath -m $(yoctoworkdir)/tmp/deploy/images/$(yoctomachine)/core-image-full-cmdline-$(yoctomachine).sdcard)
SPL=$(shell realpath -m $(yoctoworkdir)/tmp/deploy/images/$(yoctomachine)/SPL)
u-boot_crc.bin=$(shell realpath -m $(yoctoworkdir)/tmp/deploy/images/$(yoctomachine)/u-boot_crc.bin)
u-boot_crc.bin.crc=$(shell realpath -m $(yoctoworkdir)/tmp/deploy/images/$(yoctomachine)/u-boot_crc.bin.crc)
sdcardrootfs=$(shell realpath -m $(yoctoworkdir)/tmp/deploy/images/$(yoctomachine)/fsl-image-qt5-$(yoctomachine).tar.gz)
sdcardimage=fsl-image-qt5
yoctosdkdir=$(shell realpath -m $(yoctoworkdir)/tmp/deploy/sdk)
kernelimage=$(shell realpath -m $(yoctoworkdir)/tmp/deploy/images/$(yoctomachine)/zImage)

# for bsp
modelname:=tpc71wn21pa
