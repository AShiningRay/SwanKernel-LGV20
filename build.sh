#!/bin/bash
# As of now, the script always does a clean build. I still need to change a few things.

# Sets some shortcuts for terminal colors to spice things up
COLOR_N="\033[0m"
COLOR_R="\033[0;31m"
COLOR_G="\033[1;32m"
COLOR_B="\033[0;34m"
COLOR_C="\033[0;36m"
COLOR_Y="\033[1;33m"
COLOR_LP="\033[1;35m"


# This is where the paths for your compiler layout go, as well as the kernel's name.
KERNEL_NAME="SwanKernel"
#DTC=/var/lib/snapd/snap/bin/dtc
GCC_AARCH64=$HOME/toolchains/aarch64-elf/bin/aarch64-none-elf-
GCC_ARM32=$HOME/toolchains/arm-eabi/bin/arm-none-eabi-
MODEL_ARRAY=("h850" "h830" "rs988" "h870" "us997" "h872" "h910" "h918" "h990" "ls997" "us996" "vs995")
$DTC="" # This one is optional
# You can automatize the get_variant call by adding your model below
SELECTED_MODEL=""

GET_VARIANT() {
	if [[ ${SELECTED_MODEL} = "" ]]; then
		echo -e "List of available variants:"
		echo -e "G5  -> [$COLOR_C H850, H830, RS988 $COLOR_N]"
		echo -e "G6  -> [$COLOR_C H870, US997, H872 $COLOR_N]"
		echo -e "V20 -> [$COLOR_C H910, H918, H990, LS997, US996, VS995 $COLOR_N]"
		read -p "Please select your model:" SELECTED_MODEL
	fi

	# This checks if the user's model is supported by the kernel.
	if [[ " ${MODEL_ARRAY[*]} " == *" ${SELECTED_MODEL,,} "* ]];	then
		SHOW_PATHS
	else
		echo -e "${COLOR_R}Your model wasn't found. Please check for errors.${COLOR_N}"
		exit 1
	fi
}

SHOW_PATHS(){
	echo -e $COLOR_G
	echo "Printing all compiler paths and the kernel's info:"
	echo "DTC_EXT(optional): $DTC"
	echo "CLANG_TRIPLE: disabled (not needed for now)"
	echo "GCC_CC_AARCH64: $GCC_AARCH64"
	echo "GCC_CC_ARM32: $GCC_ARM32"
	echo "CLANG_CC: disabled (not needed for now)"	
	echo "KERNEL_NAME: $KERNEL_NAME"
	echo "PHONE_VARIANT:${SELECTED_MODEL,,} (forced to lowercase to load the correct defconfig)"
	echo -e $COLOR_N
	echo ""
	echo "Waiting 3 seconds before compiling..."
	sleep 3

	CHECK_CLEAN
}

CHECK_CLEAN(){
	if [ -f "$(pwd)/KernelOut/.config" ]; then
		while true; do
		    	echo -e $COLOR_Y
		    	echo -e "There's already a previous build config, you can opt to do a clean build."
		    	echo -e "If you opt not to, only the changed files from last build will be recompiled. " 
			read -p "Would you like to do a clean build (y or n)? " yn
		    	echo -e $COLOR_N
		    	case $yn in
		      		[Yy]* ) CLEAN_BUILD && break ;;
		      		[Nn]* ) BUILD_KERNEL && break ;;
		      		* ) echo -e $COLOR_R"Please answer either y or n" $COLOR_N ;;
		    	esac
		done
	else
		echo -e $COLOR_C"No previous build folder found, doing a clean build..." $COLOR_N
		BUILD_KERNEL
	fi
}

CLEAN_BUILD(){
	echo -e $COLOR_LP"Cleaning build folder..."$COLOR_N

	rm -rf KernelOut
	mkdir KernelOut
	make O=KernelOut/ clean
	make O=KernelOut/ mrproper

	echo -e $COLOR_LP"Build folder was cleaned!"$COLOR_N

	BUILD_KERNEL
}

BUILD_KERNEL(){
	echo -e $COLOR_C"\n\nBeginning compilation for ${SELECTED_MODEL,,}...\n\n" $COLOR_N
	make O=KernelOut/ ARCH=arm64 lineageos_${SELECTED_MODEL,,}_defconfig
	if ! make -j$(nproc --all) O=KernelOut/ \
	KBUILD_BUILD_VERSION=$KERNEL_NAME \
	DTC_EXT=$DTC \
	ARCH=arm64 \
	CROSS_COMPILE=$GCC_AARCH64 \
	CROSS_COMPILE_ARM32=$GCC_ARM32 ; then
		echo -e $COLOR_R"\nThe kernel couldn't be compiled... check for errors above.\n"$COLOR_N
		exit 1
	fi

	echo -e $COLOR_C"\nThe kernel has been compiled successfully!\n"$COLOR_N
}

# This is how you call a function to start the script execution, it must outside of all other functions.
GET_VARIANT
