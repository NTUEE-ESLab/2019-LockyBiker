################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
PROFILES/devinfoservice.obj: ../PROFILES/devinfoservice.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armcl" --cmd_file="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/TOOLS/defines/ble5_project_zero_cc26x2r1lp_app_FlashROM_Debug.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/build_components.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/factory_config.opt" --cmd_file="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library/TOOLS/build_config.opt"  -mv7M4 --code_state=16 -me -O2 --opt_for_speed=0 --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/Application" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/Startup" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/PROFILES" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/Include" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/controller/cc26xx/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/rom" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/target" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/common/" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/profiles/oad/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/heapmgr" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/osal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/saddr" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/sdata" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1" --include_path="/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/include" --define=DeviceFamily_CC26X2 --define=uartlog_FILE="\"devinfoservice.c\"" -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="PROFILES/devinfoservice.d_raw" --obj_directory="PROFILES" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '

PROFILES/gatt_uuid.obj: ../PROFILES/gatt_uuid.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armcl" --cmd_file="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/TOOLS/defines/ble5_project_zero_cc26x2r1lp_app_FlashROM_Debug.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/build_components.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/factory_config.opt" --cmd_file="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library/TOOLS/build_config.opt"  -mv7M4 --code_state=16 -me -O2 --opt_for_speed=0 --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/Application" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/Startup" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/PROFILES" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/Include" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/controller/cc26xx/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/rom" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/target" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/common/" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/profiles/oad/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/heapmgr" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/osal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/saddr" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/sdata" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1" --include_path="/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/include" --define=DeviceFamily_CC26X2 --define=uartlog_FILE="\"gatt_uuid.c\"" -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="PROFILES/gatt_uuid.d_raw" --obj_directory="PROFILES" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '

PROFILES/gattservapp_util.obj: ../PROFILES/gattservapp_util.c $(GEN_OPTS) | $(GEN_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armcl" --cmd_file="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/TOOLS/defines/ble5_project_zero_cc26x2r1lp_app_FlashROM_Debug.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/build_components.opt" --cmd_file="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/config/factory_config.opt" --cmd_file="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_stack_library/TOOLS/build_config.opt"  -mv7M4 --code_state=16 -me -O2 --opt_for_speed=0 --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/Application" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/Startup" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/PROFILES" --include_path="/home/ntuee/2019-LockyBiker/2019-LockyBiker/lock_ti/ble5_project_zero_cc26x2r1lp_app/Include" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/controller/cc26xx/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/rom" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/target" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/common/" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/target/_common/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/profiles/oad/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/hal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/heapmgr" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/icall/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/osal/src/inc" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/saddr" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/sdata" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/ble5stack/services/src/nv/cc26xx" --include_path="/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1" --include_path="/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/include" --define=DeviceFamily_CC26X2 --define=uartlog_FILE="\"gattservapp_util.c\"" -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --preproc_with_compile --preproc_dependency="PROFILES/gattservapp_util.d_raw" --obj_directory="PROFILES" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '


