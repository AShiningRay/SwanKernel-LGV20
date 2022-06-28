# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=VS995 Kernel by askermk2000 @ xda-developers
do.devicecheck=1
do.modules=0
do.ssdtrim=0
do.cleanup=1
do.cleanuponabort=0
device.name1=VS995
device.name2=ELSA
device.name3=vs995
device.name4=elsa
device.name5=US996
device.name6=us996
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

## Ramdisk modifications
# add mktweaks
# append_file init.rc mktweaks "init_rc-mod";

write_boot;
## end install
