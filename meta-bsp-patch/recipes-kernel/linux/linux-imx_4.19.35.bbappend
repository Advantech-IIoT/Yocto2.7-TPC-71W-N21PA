FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# file:0001-update-poweroff-problem.patch
SRC_URI += "file://0001-config-and-dts.patch \
            file://0001-add-cp210x-serial-driver.patch \
            file://0002-mcu-watchdog.patch \
            file://0003-fec-clock.patch \
            file://0004-rtl8211f.patch \
            file://0005-mcu-reboot.patch \
            file://0006-io-reset.patch \
            file://0001-enable-pci-controller.patch \
            file://0001-update-rtc-rx8010-and-add-tpc71w-devicetree-ldb-date.patch \
            file://0001-update-CONFIG-RTC-HCTOSYS-and-SYSTOHC.patch \
            file://0001-fix-mcu-reboot-unstable.patch \
            file://0001-update-poweroff-problem.patch \
            file://0001-update-ppp-support.patch \
            file://0001-add-fm25-module-supported.patch \
            "
LOCALVERSION = ""
