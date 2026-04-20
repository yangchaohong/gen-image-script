source env.sh
cp $FDT_PATH ./sunxi.dtb
cp $ZIMAGE_PATH .
cp $SYTER_BOOT_PATH .
cp $SYTER_BOOT_SDNAND_PATH .

dd if=/dev/zero of=rootfs.ext4 bs=1M count=500

#rootfs
mkfs.ext4 rootfs.ext4
mkdir -p mnt
sudo mount rootfs.ext4 mnt
sudo cp -r ../rootfs/* ./mnt/
sudo cp zImage ./mnt/root/flash2emmc
sudo cp sunxi.dtb ./mnt/root/flash2emmc
sudo cp syter_boot_sdnand_bin_card.bin ./mnt/root/flash2emmc
sudo umount mnt
