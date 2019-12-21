################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
build-1249397825:
	@$(MAKE) --no-print-directory -Onone -f TOOLS/subdir_rules.mk build-1249397825-inproc

build-1249397825-inproc: ../TOOLS/ble_release.cfg
	@echo 'Building file: "$<"'
	@echo 'Invoking: XDCtools'
	"/home/ntuee/ti/xdctools_3_50_08_24_core/xs" --xdcpath="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source;/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/kernel/tirtos/packages;/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack;" xdc.tools.configuro -o configPkg -t ti.targets.arm.elf.M4F -p ti.platforms.simplelink:CC2642R1F -r release -c "/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS" --compileOptions "-mv7M4 --code_state=16 -me -O4 --opt_for_speed=0 --include_path=\"/Application\" --include_path=\"/Startup\" --include_path=\"/PROFILES\" --include_path=\"/Include\" --include_path=\"/controller/cc26xx/inc\" --include_path=\"/inc\" --include_path=\"/rom\" --include_path=\"/common/cc26xx\" --include_path=\"/\" --include_path=\"/icall/inc\" --include_path=\"/target\" --include_path=\"/profiles/oad/cc26xx\" --include_path=\"/hal/src/target/_common\" --include_path=\"/hal/src/target/_common/cc26xx\" --include_path=\"/hal/src/inc\" --include_path=\"/heapmgr\" --include_path=\"/icall/src/inc\" --include_path=\"/osal/src/inc\" --include_path=\"/services/src/saddr\" --include_path=\"/services/src/sdata\" --include_path=\"/services/src/nv\" --include_path=\"/services/src/nv/cc26xx\" --include_path=\"/source/ti/devices/cc13x2_cc26x2_v1\" --include_path=\"/include\" --define=DeviceFamily_CC26X2 --define=uartlog_FILE=\"\"\"\" -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi " "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

configPkg/linker.cmd: build-1249397825 ../TOOLS/ble_release.cfg
configPkg/compiler.opt: build-1249397825
configPkg/: build-1249397825


