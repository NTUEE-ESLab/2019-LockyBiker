################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
Startup/ble_user_config.obj: /home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/stack/ble_user_config.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armcl" --cmd_file="/home/ntuee/Lock_CC26X2R1/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library/TOOLS/defines/ble5_project_zero_cc26x2r1lp_stack_library_FlashROM_Library.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/build_components.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/factory_config.opt" --cmd_file="/home/ntuee/Lock_CC26X2R1/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library/TOOLS/build_config.opt"  -mv7M4 --code_state=16 -me -O4 --opt_for_speed=0 --include_path="/home/ntuee/Lock_CC26X2R1/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/controller/cc26xx/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/rom" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx/npi/stack" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/npi/src" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/osal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/aes/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/saddr" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1/rf_patches" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/kernel/tirtos/packages" --include_path="/home/ntuee/ti/xdctools_3_50_08_24_core/packages" --include_path="/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/include" --define=DeviceFamily_CC26X2 -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Startup/$(basename $(<F)).d_raw" --obj_directory="Startup" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '

Startup/icall_startup.obj: /home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx/icall_startup.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armcl" --cmd_file="/home/ntuee/Lock_CC26X2R1/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library/TOOLS/defines/ble5_project_zero_cc26x2r1lp_stack_library_FlashROM_Library.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/build_components.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/factory_config.opt" --cmd_file="/home/ntuee/Lock_CC26X2R1/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library/TOOLS/build_config.opt"  -mv7M4 --code_state=16 -me -O4 --opt_for_speed=0 --include_path="/home/ntuee/Lock_CC26X2R1/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/controller/cc26xx/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/rom" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx/npi/stack" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/npi/src" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/osal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/aes/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/saddr" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1/rf_patches" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/kernel/tirtos/packages" --include_path="/home/ntuee/ti/xdctools_3_50_08_24_core/packages" --include_path="/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/include" --define=DeviceFamily_CC26X2 -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Startup/$(basename $(<F)).d_raw" --obj_directory="Startup" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '

Startup/osal_icall_ble.obj: /home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/examples/rtos/CC26X2R1_LAUNCHXL/ble5stack/project_zero/src/stack/osal_icall_ble.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armcl" --cmd_file="/home/ntuee/Lock_CC26X2R1/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library/TOOLS/defines/ble5_project_zero_cc26x2r1lp_stack_library_FlashROM_Library.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/build_components.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/factory_config.opt" --cmd_file="/home/ntuee/Lock_CC26X2R1/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library/TOOLS/build_config.opt"  -mv7M4 --code_state=16 -me -O4 --opt_for_speed=0 --include_path="/home/ntuee/Lock_CC26X2R1/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/controller/cc26xx/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/rom" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx/npi/stack" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/npi/src" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/osal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/aes/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/saddr" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1/rf_patches" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/kernel/tirtos/packages" --include_path="/home/ntuee/ti/xdctools_3_50_08_24_core/packages" --include_path="/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/include" --define=DeviceFamily_CC26X2 -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="Startup/$(basename $(<F)).d_raw" --obj_directory="Startup" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '


