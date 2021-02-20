#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

AOSP_ROOT="$MY_DIR"/../../..

HELPER="$AOSP_ROOT"/vendor/aosp/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
source "${HELPER}"

# Initialize the helper
setup_vendor "$DEVICE_COMMON" "$VENDOR" "$AOSP" true

# Warning headers and guards
write_headers "cheeseburger dumpling"

# The standard common blobs
write_makefiles "${MY_DIR}/proprietary-files.txt" true

cat << EOF >> "$ANDROIDMK"

\$(shell mkdir -p \$(TARGET_OUT_VENDOR)/lib/egl && pushd \$(TARGET_OUT_VENDOR)/lib > /dev/null && ln -sf egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
\$(shell mkdir -p \$(TARGET_OUT_VENDOR)/lib64/egl && pushd \$(TARGET_OUT_VENDOR)/lib64 > /dev/null && ln -sf egl/libEGL_adreno.so libEGL_adreno.so && popd > /dev/null)
EOF

# Finish
write_footers

if [ -s "${MY_DIR}/../${DEVICE}/proprietary-files.txt" ]; then
    # Reinitialize the helper for device
    INITIAL_COPYRIGHT_YEAR="$DEVICE_BRINGUP_YEAR"
    setup_vendor "$DEVICE" "$VENDOR" "$AOSP_ROOT" false

    # Warning headers and guards
    write_headers

    # The standard device blobs
    write_makefiles "${MY_DIR}/../${DEVICE}/proprietary-files.txt" true

    # Finish
    write_footers
fi
