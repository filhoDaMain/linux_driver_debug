#!/bin/bash

source ENV_TARGET
source ENV_LINUX_DRIVER

PROBE_CMD="modprobe ${LINUX_DRIVER_NAME} > /dev/null 2>&1 &"
ssh ${TARGET_SSH} ${PROBE_CMD}
