# SPDX-License-Identifier: GPL-2.0-only

KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
M ?= $(shell pwd)

KBUILD_OPTIONS += CONFIG_KSU=m
# non-exported kernel symbols are resolved against kallsyms by ksud insmod at load time
KBUILD_OPTIONS += KBUILD_MODPOST_WARN=1

modules modules_install clean compile_commands.json:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $(KBUILD_OPTIONS) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" $(@)
