make O=AKernelOut clean && make O=AKernelOut mrproper
make O=AKernelOut ARCH=arm64 SUBARCH=arm64 lineageos_h910_defconfig
#PATH="/home/paulo/Documentos/V20CustomKernel/CLANG/bin/:/home/paulo/Documentos/V20CustomKernel/toolchainaarch64/bin/:/home/paulo/Documentos/V20CustomKernel/toolchainarm32/bin/ ${PATH}" \
make -j$(nproc --all) O=AKernelOut \
		      DTC_EXT=dtc \
		      KBUILD_BUILD_VERSION="SwanKernel" \
                      ARCH=arm64 \
		      SUBARCH=arm64 \
                      CC=/home/paulo/Documentos/V20CustomKernel/CLANG/bin/clang \
                      CLANG_TRIPLE=/home/paulo/Documentos/V20CustomKernel/CLANG/bin/aarch64-linux-gnu- \
                      CROSS_COMPILE=/home/paulo/Documentos/V20CustomKernel/toolchainaarch64/bin/aarch64-linux-androidkernel- | tee AKernelOut/swanKernel.log #\
		      #CROSS_COMPILE_ARM32=/home/paulo/Documentos/V20CustomKernel/toolchainarm32/bin/arm-linux-androidkernel- 