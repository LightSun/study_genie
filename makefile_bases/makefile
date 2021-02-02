SILENT?=@
make_dir:=$(shell pwd)
dir1:=$(shell pwd)/$(lastword $(MAKEFILE_LIST)) #/makefile
THISDIR:=$(dir $(lastword $(MAKEFILE_LIST)))
UNAME:=$(shell uname)
#.PHONY: PRINT
#PRINT:
    #... 
all:
	@echo ${UNAME}
	@echo $(make_dir) 
	@echo $(dir)
	@echo $(dirname)
	@echo $(dir1)
	echo $(THISDIR)