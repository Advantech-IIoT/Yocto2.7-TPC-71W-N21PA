FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-config-and-dts.patch \
            file://0001-mcu-watchdog.patch \
            file://0001-fec-clock.patch \
            file://0001-rtl8211f.patch \
            file://0001-mcu-reboot.patch \
            "
LOCALVERSION = ""
