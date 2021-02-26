TARGET=mdio-tool
SRCS=$(TARGET).c
CURRDIR=$(shell pwd)
builddir=$(CURRDIR)/build
CFLAGS=-Wall --save-temp
