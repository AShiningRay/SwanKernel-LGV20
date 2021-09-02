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
		      CC=$HOME/androidkerneltools/CLANG/bin/clang | tee KernelOut/swanKernel.log
