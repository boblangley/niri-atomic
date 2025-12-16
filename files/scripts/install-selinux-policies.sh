#!/usr/bin/env bash

# Tell build process to exit if there are errors
set -oue pipefail

echo "Compiling Custom SELinux Policies..."

# Check if policy tools are installed, if not, this would fail (they are in base image)
# Navigate to where we placed the.te file via the 'files' module
cd /usr/share/selinux/packages/

if [ -f howdy.te ]; then
    # 1. Compile text (.te) to binary module (.mod)
    checkmodule -M -m -o howdy.mod howdy.te
    # 2. Package the module (.pp)
    semodule_package -o howdy.pp -m howdy.mod
    # 3. Install the module into the system store
    semodule -i howdy.pp
    echo "SUCCESS: Howdy SELinux policy installed."
else
    echo "ERROR: howdy.te not found!"
    exit 1
fi