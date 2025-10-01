#!/bin/bash

source ENV_TARGET
source ENV_LINUX_DRIVER

REMOVE_CMD="modprobe -r ${LINUX_DRIVER_NAME} > /dev/null 2>&1 &"

ssh ${TARGET_SSH} ${REMOVE_CMD}
