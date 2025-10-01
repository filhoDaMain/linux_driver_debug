#!/bin/bash

source ENV_TARGET

SET_UART_CMD="echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc"
SYSRQ_TRIGGER_CMD="echo g > /proc/sysrq-trigger"

echo "Executing on ${TARGET_SSH}"
echo "  $ ${SET_UART_CMD}"
echo "  $ ${SYSRQ_TRIGGER_CMD}"
echo "Waiting..."

ssh ${TARGET_SSH} -f ${SET_UART_CMD}
sleep 1
ssh ${TARGET_SSH} -f ${SYSRQ_TRIGGER_CMD}
sleep 1
