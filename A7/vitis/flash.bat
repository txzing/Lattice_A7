@echo off

call D:\Xilinx\Vitis\2020.1\settings64.bat

if exist output/ (
    cd output
) else (
    echo No image gerated!
    pause
    exit /b 0
)

::echo program_flash -f app.bin -offset 0 -flash_type mt25ql128-spi-x1_x2_x4 -verify -cable type xilinx_tcf url TCP:127.0.0.1:3121
::program_flash -f app.bin -offset 0 -flash_type mt25ql128-spi-x1_x2_x4 -verify -cable type xilinx_tcf url TCP:127.0.0.1:3121

program_flash -f BOOT.bin -fsbl fsbl.elf -offset 0 -flash_type qspi-x4-single -cable type xilinx_tcf
::program_flash -f BOOT.bin -fsbl fsbl.elf -offset 0x500000 -flash_type qspi-x4-single -cable type xilinx_tcf
::echo Can not flash winbond directly

pause
