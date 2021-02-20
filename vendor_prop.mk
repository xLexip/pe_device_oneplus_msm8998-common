#
# Copyright (C) 2018-2021 The LineageOS Project
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

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.camera.aux.packagelist=com.google.android.GoogleCameraEng,org.codeaurora.snapcam,com.oneplus.camera \
    persist.vendor.camera.privapp.list=com.google.android.GoogleCameraEng,org.codeaurora.snapcam,com.oneplus.camera \
    vendor.camera.hal1.packagelist=com.whatsapp \
    persist.camera.mobicat=2 \
    persist.camera.stats.debugexif=3080192 \
    persist.ts.rtmakeup=false \
    persist.vendor.camera.tintless.skip=1 \
    persist.camera.eis.enable=1 \
    persist.camera.is_mode=4 \
    persist.vendor.camera.oissr.debug=1 \
    vendor.debug.camera.eisv2enable=1 \
    vendor.debug.camera.eisv3enable=1