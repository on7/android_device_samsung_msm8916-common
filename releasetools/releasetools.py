# Copyright (C) 2009 The Android Open Source Project
# Copyright (c) 2011-2013, The Linux Foundation. All rights reserved.
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

import common
import re
import os

def FullOTA_InstallBegin(info):
    info.script.AppendExtra('ifelse(is_mounted("/system"), unmount("/system"));')
    info.script.Print("Mounting /system...")
    info.script.Mount("/system")
    info.script.Print("Checking SDK version...")
    info.script.AppendExtra('package_extract_file("install/bin/check_sdk_version.sh", "/tmp/check_sdk_version.sh");')
    info.script.AppendExtra('rename("/tmp/check_sdk_version.sh", "/tmp/install/bin/check_sdk_version.sh");')
    info.script.AppendExtra('set_metadata("/tmp/install/bin/check_sdk_version.sh", "uid", 0, "gid", 0, "dmode", 0755, "fmode", 0755);')
    info.script.AppendExtra('ifelse((run_program("/tmp/install/bin/check_sdk_version.sh") != 0), abort("Refusing to downgrade system. Wipe data and system first or install proper package."));')
    info.script.Unmount("/system")
