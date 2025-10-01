define connect
    target remote DEBUGGER_SERIAL_DEVICE
end


python
import os

gdb.execute('set pagination off')
gdb.execute('source LINUX_KERNEL_GDBPY')
gdb.execute('set sysroot DEBUGGER_TARGET_SYSROOT')
gdb.execute('set substitute-path /usr/src/kernel LINUX_KERNEL_SOURCES')
gdb.execute('set substitute-path LINUX_DRIVER_SUBSPATH LINUX_DRIVER_SOURCES')
gdb.execute('add-auto-load-safe-path LINUX_DRIVER_KO_HOSTDIR')
gdb.execute('set serial baud DEBUGGER_SERIAL_BAUDRATE')
gdb.execute('connect')
gdb.execute('lx-symbols LINUX_DRIVER_KO_HOSTDIR')

end
