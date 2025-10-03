#!/bin/bash

# Run this script to start a KGDB session with CGDB as its frontend

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd ${SCRIPT_DIR}/

./make_gdbinit.sh
./remove_driver.sh
./upload_driver.sh

# Auto enter debug mode in target:
./kernel_enter_debugmode.sh

# Start GDB in host
source ENV_DEBUGGER
source ENV_LINUX_KERNEL
source ENV_LINUX_DRIVER

cgdb -d ${DEBUGGER_CROSSDEBUGER} -q -x gdbinit ${LINUX_KERNEL_VMLINUX}
