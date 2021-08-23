make O=KernelOut clean && make O=KernelOut mrproper
make O=KernelOut ARCH=arm64 lineageos_h910_defconfig
make -j$(nproc --all) O=KernelOut \
		      KBUILD_BUILD_VERSION="SwanKernel" \
                      ARCH=arm64 CONFIG_BUILD_ARM64_DT_OVERLAY=y DTC_EXT=dtc \
                      CLANG_TRIPLE=/home/paulo/Documentos/V20CustomKernel/CLANG/bin/aarch64-linux-gnu- \
                      CROSS_COMPILE=/home/paulo/Documentos/V20CustomKernel/toolchainaarch64/bin/aarch64-none-linux-gnu- \
		      CROSS_COMPILE_ARM32=/home/paulo/Documentos/V20CustomKernel/toolchainarm32/bin/arm-linux-androideabi- \
		      CC=/home/paulo/Documentos/V20CustomKernel/CLANG/bin/clang | tee KernelOut/swanKernel.log
