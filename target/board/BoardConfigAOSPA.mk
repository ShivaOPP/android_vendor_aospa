#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

# Dex2oat
ifeq ($(TARGET_CPU_VARIANT),cortex-a510)
    DEX2OAT_TARGET_CPU_VARIANT := cortex-a76
    DEX2OAT_TARGET_CPU_VARIANT_RUNTIME := cortex-a76
endif

ifeq ($(call is-board-platform-in-list,$(QCOM_BOARD_PLATFORMS)),true)
# Include our Qualcomm Board configuration.
include device/qcom/common/BoardConfigQcom.mk
endif

# Include our private configuration - optional.
-include vendor/aospa-priv/target/board/BoardConfigAOSPAPriv.mk

# Kernel configuration.
include vendor/aospa/target/board/BoardConfigKernel.mk

# Soong
include vendor/aospa/target/board/BoardConfigSoong.mk

ifeq ($(TARGET_DEVICE),porsche)
# TODO(porsche): the A17 common tree includes Oplus policy while BoardConfig is
# loaded, before this file adds CLO policy. checkpolicy requires domain types
# before extensions use typeattribute (for example vendor_hal_imsrtp).
porsche_qcom_policy_dirs := $(filter device/qcom/sepolicy_vndr% device/qcom/common/sepolicy%,$(BOARD_VENDOR_SEPOLICY_DIRS))
BOARD_VENDOR_SEPOLICY_DIRS := $(porsche_qcom_policy_dirs) $(filter-out $(porsche_qcom_policy_dirs),$(BOARD_VENDOR_SEPOLICY_DIRS))
endif
