# KernelSU-Next (v3.4.2) for the Pixel 6a (bluejay) gs-6.1 kernel tree

KernelSU-Next kernel module (`kernelsu.ko`) packaged for the LineageOS `gs-6.1` Kleaf/Bazel
kernel workspace. Source is KernelSU-Next v3.4.2 (version 33355) with these changes:

- `Kbuild`: include paths use `$(srctree)/$(src)` (Kleaf compiles from the out dir); fallback version/tag set to 33355 / v3.4.2.
- `uapi/`: copied from the KernelSU-Next repo root (needed by `kernel/`).
- `selinux_gen/`: `flask.h` / `av_permissions.h` generated with the kernel's `scripts/selinux/genheaders` from android14-6.1 (not exported to external modules).
- `Makefile` + `BUILD.bazel`: Kleaf `kernel_module`, built with `KBUILD_MODPOST_WARN=1` (non-exported symbols are resolved by `ksud` at load time).

Place it at `private/google-modules/kernelsu` (see the manifest repo) and build:

    tools/bazel build --config=bluejay //private/google-modules/kernelsu:kernelsu

Tested only via `fastboot boot` of a boot image patched with `ksud boot-patch-v2` (manager shows Working, LKM GKI2).
Licence: GPL-2.0 (see LICENSE). Upstream: https://github.com/KernelSU-Next/KernelSU-Next
