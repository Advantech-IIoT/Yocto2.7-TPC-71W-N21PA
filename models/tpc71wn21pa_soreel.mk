ifeq ($(modelname),tpc71wn21pa_soreel)
bspname:=TPC71W-N21PA-r1-Ubuntu1604-SOREEL-$(shell date +"%Y%m%d")
bspspl=$(currdir)/bsp/spl/n21pa
bsplogo=$(currdir)/bsp/logo/soreel/adv_logo_1024x600_32bpp.bmp
bspscripts=$(currdir)/bsp/scripts/basic
bspdtbname=imx6q-tpc71w-n21pa.dtb
bspdtb=$(shell realpath -m $(yoctoworkdir)/tmp/deploy/images/$(yoctomachine)/$(bspdtbname))
endif
