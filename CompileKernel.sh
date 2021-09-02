printf "\n\nBeginning compilation of the H910-H15 version...\n\n"

rm -rf KernelOut
mkdir KernelOut
make O=KernelOut/H910-H915 clean
make O=KernelOut/H910-H915 mrproper
make O=KernelOut/H910-H915 ARCH=arm64 lineageos_h910_defconfig
make -j$(nproc --all) O=KernelOut/H910-H915 \
		      KBUILD_BUILD_VERSION="SwanKernel" \
                      ARCH=arm64 CONFIG_BUILD_ARM64_DT_OVERLAY=y DTC_EXT=/var/lib/snapd/snap/bin/dtc \
                      CLANG_TRIPLE=$HOME/androidkerneltools/CLANG/bin/aarch64-linux-gnu- \
                      CROSS_COMPILE=$HOME/androidkerneltools/toolchainaarch64/bin/aarch64-none-linux-gnu- \
		      CROSS_COMPILE_ARM32=$HOME/androidkerneltools/toolchainarm32/bin/arm-linux-androideabi- \
		      CC=$HOME/androidkerneltools/CLANG/bin/clang | tee KernelOut/swanKernel_H910-H915.log

printf "\n\n*******H910-H915 Version has been Compiled successfully!*******\n\nBeginning compilation of the H918 version...\n\n"
sleep 3

make O=KernelOut/H918 clean
make O=KernelOut/H918 mrproper
make O=KernelOut/H918 ARCH=arm64 lineageos_h918_defconfig
make -j$(nproc --all) O=KernelOut/H918 \
		      KBUILD_BUILD_VERSION="SwanKernel" \
                      ARCH=arm64 CONFIG_BUILD_ARM64_DT_OVERLAY=y DTC_EXT=/var/lib/snapd/snap/bin/dtc \
                      CLANG_TRIPLE=$HOME/androidkerneltools/CLANG/bin/aarch64-linux-gnu- \
                      CROSS_COMPILE=$HOME/androidkerneltools/toolchainaarch64/bin/aarch64-none-linux-gnu- \
		      CROSS_COMPILE_ARM32=$HOME/androidkerneltools/toolchainarm32/bin/arm-linux-androideabi- \
		      CC=$HOME/androidkerneltools/CLANG/bin/clang | tee KernelOut/swanKernel_H918.log

printf "\n\n*******H918 Version has been Compiled successfully!*******\n\nBeginning compilation of the H990 version...\n\n"
sleep 3

make O=KernelOut/H990 clean
make O=KernelOut/H990 mrproper
make O=KernelOut/H990 ARCH=arm64 lineageos_h990_defconfig
make -j$(nproc --all) O=KernelOut/H990 \
		      KBUILD_BUILD_VERSION="SwanKernel" \
                      ARCH=arm64 CONFIG_BUILD_ARM64_DT_OVERLAY=y DTC_EXT=/var/lib/snapd/snap/bin/dtc \
                      CLANG_TRIPLE=$HOME/androidkerneltools/CLANG/bin/aarch64-linux-gnu- \
                      CROSS_COMPILE=$HOME/androidkerneltools/toolchainaarch64/bin/aarch64-none-linux-gnu- \
		      CROSS_COMPILE_ARM32=$HOME/androidkerneltools/toolchainarm32/bin/arm-linux-androideabi- \
		      CC=$HOME/androidkerneltools/CLANG/bin/clang | tee KernelOut/swanKernel_H990.log

printf "\n\n*******H990 Version has been Compiled successfully!*******\n\nBeginning compilation of the LS997 version...\n\n"
sleep 3

make O=KernelOut/LS997 clean
make O=KernelOut/LS997 mrproper
make O=KernelOut/LS997 ARCH=arm64 lineageos_ls997_defconfig
make -j$(nproc --all) O=KernelOut/LS997 \
		      KBUILD_BUILD_VERSION="SwanKernel" \
                      ARCH=arm64 CONFIG_BUILD_ARM64_DT_OVERLAY=y DTC_EXT=/var/lib/snapd/snap/bin/dtc \
                      CLANG_TRIPLE=$HOME/androidkerneltools/CLANG/bin/aarch64-linux-gnu- \
                      CROSS_COMPILE=$HOME/androidkerneltools/toolchainaarch64/bin/aarch64-none-linux-gnu- \
		      CROSS_COMPILE_ARM32=$HOME/androidkerneltools/toolchainarm32/bin/arm-linux-androideabi- \
		      CC=$HOME/androidkerneltools/CLANG/bin/clang | tee KernelOut/swanKernel_LS997.log

printf "\n\n*******LS997 Version has been Compiled successfully!*******\n\nBeginning compilation of the US996 version...\n\n"
sleep 3

make O=KernelOut/US996 clean
make O=KernelOut/US996 mrproper
make O=KernelOut/US996 ARCH=arm64 lineageos_us996_defconfig
make -j$(nproc --all) O=KernelOut/US996 \
		      KBUILD_BUILD_VERSION="SwanKernel" \
                      ARCH=arm64 CONFIG_BUILD_ARM64_DT_OVERLAY=y DTC_EXT=/var/lib/snapd/snap/bin/dtc \
                      CLANG_TRIPLE=$HOME/androidkerneltools/CLANG/bin/aarch64-linux-gnu- \
                      CROSS_COMPILE=$HOME/androidkerneltools/toolchainaarch64/bin/aarch64-none-linux-gnu- \
		      CROSS_COMPILE_ARM32=$HOME/androidkerneltools/toolchainarm32/bin/arm-linux-androideabi- \
		      CC=$HOME/androidkerneltools/CLANG/bin/clang | tee KernelOut/swanKernel_US996.log

printf "\n\n*******US996 Version has been Compiled successfully!*******\n\nBeginning compilation of the VS995 version...\n\n"
sleep 3

make O=KernelOut/VS995 clean
make O=KernelOut/VS995 mrproper
make O=KernelOut/VS995 ARCH=arm64 lineageos_vs995_defconfig
make -j$(nproc --all) O=KernelOut/VS995 \
		      KBUILD_BUILD_VERSION="SwanKernel" \
                      ARCH=arm64 CONFIG_BUILD_ARM64_DT_OVERLAY=y DTC_EXT=/var/lib/snapd/snap/bin/dtc \
                      CLANG_TRIPLE=$HOME/androidkerneltools/CLANG/bin/aarch64-linux-gnu- \
                      CROSS_COMPILE=$HOME/androidkerneltools/toolchainaarch64/bin/aarch64-none-linux-gnu- \
		      CROSS_COMPILE_ARM32=$HOME/androidkerneltools/toolchainarm32/bin/arm-linux-androideabi- \
		      CC=$HOME/androidkerneltools/CLANG/bin/clang | tee KernelOut/swanKernel_VS995.log

printf "\n\n*******VS995 Version has been Compiled successfully!*******\n\nAll versions have been compiled successfully! Check their respective folders' arch/arm64/boot for their image.gz-dtb"
sleep 3