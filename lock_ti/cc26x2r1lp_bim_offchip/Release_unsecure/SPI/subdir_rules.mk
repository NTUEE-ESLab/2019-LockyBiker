################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
SPI/bsp_spi.obj: /home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/common/cc26xx/board_support_pkg/CC26X2R1_CC13X2R1_LAUNCHXL/bsp_spi.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armcl" --cmd_file="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/cc26x2r1lp_bim_offchip/TOOLS/defines/cc26x2r1lp_bim_offchip_Release_unsecure.opt"  -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -O4 --opt_for_speed=0 --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/cc26x2r1lp_bim_offchip" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1/startup_files" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/common/cc26xx/board_support_pkg/CC26X2R1_CC13X2R1_LAUNCHXL/" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1" --include_path="/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/include" --define=DeviceFamily_CC26X2 -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="SPI/$(basename $(<F)).d_raw" --obj_directory="SPI" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '


