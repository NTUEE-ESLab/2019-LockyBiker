################################################################################
# Automatically-generated file. Do not edit!
################################################################################

CG_TOOL_ROOT := /home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS

GEN_OPTS__FLAG := 
GEN_CMDS__FLAG := 

ORDERED_OBJS += \
"./Application/bim_main.obj" \
"./Application/bim_util.obj" \
"./Application/ccfg_app.obj" \
"./Application/crc32.obj" \
"./Application/flash_interface_internal.obj" \
"./Application/led_debug.obj" \
"./Application/startup_ccs.obj" \
"./ExternalFlash/ext_flash.obj" \
"./SPI/bsp_spi.obj" \
"/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/common/cc26xx/ccs/bim_cc26x2_cc13x2.cmd" \
$(GEN_CMDS__FLAG) \
-l"/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1/driverlib/bin/ccs/driverlib.lib" \
-llibc.a \

-include ../makefile.init

RM := rm -rf
RMDIR := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Application/subdir_vars.mk
-include ExternalFlash/subdir_vars.mk
-include SPI/subdir_vars.mk
-include TOOLS/subdir_vars.mk
-include TOOLS/defines/subdir_vars.mk
-include Application/subdir_rules.mk
-include ExternalFlash/subdir_rules.mk
-include SPI/subdir_rules.mk
-include TOOLS/subdir_rules.mk
-include TOOLS/defines/subdir_rules.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(INO_DEPS)),)
-include $(INO_DEPS)
endif
ifneq ($(strip $(CLA_DEPS)),)
-include $(CLA_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(SV7A_DEPS)),)
-include $(SV7A_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(PDE_DEPS)),)
-include $(PDE_DEPS)
endif
ifneq ($(strip $(K_DEPS)),)
-include $(K_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXE_OUTPUTS += \
cc26x2r1lp_bim_offchip.out \

EXE_OUTPUTS__QUOTED += \
"cc26x2r1lp_bim_offchip.out" \

BIN_OUTPUTS += \
cc26x2r1lp_bim_offchip.hex \

BIN_OUTPUTS__QUOTED += \
"cc26x2r1lp_bim_offchip.hex" \


# All Target
all: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@$(MAKE) --no-print-directory -Onone "cc26x2r1lp_bim_offchip.out"

# Tool invocations
cc26x2r1lp_bim_offchip.out: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@echo 'Building target: "$@"'
	@echo 'Invoking: ARM Linker'
	"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armcl" --cmd_file="/home/ntuee/lock_ti/cc26x2r1lp_bim_offchip/TOOLS/defines/cc26x2r1lp_bim_offchip_Release_unsecure.opt"  -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -O4 --opt_for_speed=0 --define=DeviceFamily_CC26X2 -g --c99 --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi -z -m"cc26x2r1lp_bim_offchip.map" --heap_size=0 --stack_size=256 -i"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/lib" -i"/home/ntuee/ti/simplelink_cc26x2_sdk_2_30_00_34/source/ti/devices/cc13x2_cc26x2_v1/driverlib/bin/ccs/" -i"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/include" --reread_libs --diag_suppress=16002-D --diag_suppress=10247-D --diag_suppress=10325-D --diag_suppress=10229-D --diag_wrap=off --display_error_number --warn_sections --xml_link_info="cc26x2r1lp_bim_offchip_linkInfo.xml" --rom_model -o "cc26x2r1lp_bim_offchip.out" $(ORDERED_OBJS)
	@echo 'Finished building target: "$@"'
	@echo ' '
	@$(MAKE) --no-print-directory post-build

cc26x2r1lp_bim_offchip.hex: $(EXE_OUTPUTS)
	@echo 'Building files: $(strip $(EXE_OUTPUTS__QUOTED))'
	@echo 'Invoking: ARM Hex Utility'
	"/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armhex" --memwidth=8 --romwidth=8 --intel -o "cc26x2r1lp_bim_offchip.hex" $(EXE_OUTPUTS__QUOTED)
	@echo 'Finished building: $(strip $(EXE_OUTPUTS__QUOTED))'
	@echo ' '
	@$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(BIN_OUTPUTS__QUOTED)$(EXE_OUTPUTS__QUOTED)
	-$(RM) "Application/bim_main.obj" "Application/bim_util.obj" "Application/ccfg_app.obj" "Application/crc32.obj" "Application/flash_interface_internal.obj" "Application/led_debug.obj" "Application/startup_ccs.obj" "ExternalFlash/ext_flash.obj" "SPI/bsp_spi.obj" 
	-$(RM) "Application/bim_main.d" "Application/bim_util.d" "Application/ccfg_app.d" "Application/crc32.d" "Application/flash_interface_internal.d" "Application/led_debug.d" "Application/startup_ccs.d" "ExternalFlash/ext_flash.d" "SPI/bsp_spi.d" 
	-@echo 'Finished clean'
	-@echo ' '

post-build:
	-/home/ntuee/ti/ccs910/ccs/tools/compiler/ti-cgt-arm_18.12.2.LTS/bin/armhex -order MS --memwidth=8 --romwidth=8 --intel -o cc26x2r1lp_bim_offchip.hex cc26x2r1lp_bim_offchip
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

