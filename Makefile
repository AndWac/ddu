#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"). You may
# only use this file in accordance with the terms of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2019 Alexander Pyhalov
#

include include/common.mk

SUBDIRS = config data ddu ddu-text gnome-help po utils scripts Legal_Documents

all:		TARGET= all
clean:		TARGET= clean 
install:	TARGET= install

.PHONY: $(SUBDIRS)

all clean install: $(SUBDIRS)
	
$(SUBDIRS):
	@cd $@; pwd; $(MAKE) $(TARGET) 

clean:

env_prep:
# Don't fail when no updates are needed
	$(SUDO) $(PKG) install $(REQUIRED_PACKAGES:%=pkg:/%) || [ $$? -eq 4 ]
