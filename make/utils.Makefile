ifeq (Linux, $(shell uname -s))
include $(abspath make/utils.Linux.Makefile)
endif

ifeq (Darwin, $(shell uname -s))
include $(abspath make/utils.Darwin.Makefile)
endif

guhcampos-utils: | ag
