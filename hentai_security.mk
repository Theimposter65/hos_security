#
# Copyright (C) 2018 The Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Define security directory
PROD_CERTS := vendor/hentai/build/target/product/security

# AVB
BOARD_AVB_KEY_PATH := $(PROD_CERTS)/hentai_rsa4096.pem
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# AVB BOOT
BOARD_AVB_BOOT_KEY_PATH := $(PROD_CERTS)/hentai_rsa4096.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 3

ifneq ($(strip $(BOARD_DYNAMIC_PARTITION_ENABLE)),true)
# settings for system, which is configured as chain partition
BOARD_AVB_SYSTEM_KEY_PATH := $(PROD_CERTS)/hentai_rsa4096.pem
BOARD_AVB_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# settings for vendor, which is configured as chain partition
BOARD_AVB_VENDOR_KEY_PATH := $(PROD_CERTS)/hentai_rsa4096.pem
BOARD_AVB_VENDOR_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VENDOR_ROLLBACK_INDEX_LOCATION := 4
else
# settings for system
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := $(PROD_CERTS)/hentai_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# settings for vendor
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := $(PROD_CERTS)/hentai_rsa4096.pem
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 1
endif

# Chimera signature flags
SIGNING_FLAGS := -e PrebuiltGmsCoreRvc_AdsDynamite.apk= -e PrebuiltGmsCoreRvc_DynamiteLoader.apk= -e PrebuiltGmsCoreRvc_DynamiteModulesA.apk= -e PrebuiltGmsCoreRvc_DynamiteModulesC.apk= -e PrebuiltGmsCoreRvc_GoogleCertificates.apk= -e PrebuiltGmsCoreRvc_MapsDynamite.apk= -e PrebuiltGmsCoreRvc_MeasurementDynamite.apk= -e AndroidPlatformServices.apk=

# Apex signature flags
APEX_SIGNING_FLAGS := -e com.android.art.release.apex=$(PROD_CERTS)/releasekey -e com.android.art.debug.apex=$(PROD_CERTS)/releasekey -e com.android.i18n.apex=$(PROD_CERTS)/releasekey -e com.android.runtime.apex=$(PROD_CERTS)/releasekey -e com.android.tethering.apex=$(PROD_CERTS)/networkstack -e com.android.vndk.current.apex=$(PROD_CERTS)/releasekey
