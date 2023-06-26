@echo off

call D:\Xilinx\Vitis\2020.1\settings64.bat

set top=%cd%
::echo puts [pwd] | xsct
::for /f "delims=" %%i in ( 'ipconfig /all^| find /i "ipv4" ') do set MYIP=%%i & echo %MYIP%
::FOR /F "tokens=*" %%g IN ('bash -i -c "pwd"') do (SET VAR=%%g)
::printf %VAR%
::pause
::FOR /F "delims=" %%g IN ('echo puts [pwd]^| xsct') do (SET VAR=%%g)
::printf %VAR%
::pause
FOR /F "delims=" %%g IN ('echo puts [pwd]^| xsct') do (SET TOPDIR=%%g)
printf %TOPDIR%
::pause

cd .\sdk_workspace\vitis_proj\_ide\bitstream

:: updatemem -meminfo system_wrapper.mmi -data ..\..\Debug\vitis_proj.elf -proc system_i\microblaze_0 -bit system_wrapper.bit -out download.bit -force
:: mkdir -p ..\flash
:: (set BITFILE= %cd%\download.bit & echo the_ROM_image: & echo { & echo %BITFILE% & echo }) > ..\flash\bootimage.bif
:: bootgen -arch fpga -image ..\flash\bootimage.bif -w -o ..\flash\BOOT.bin -interface spi

mkdir ..\bootimage
set FSBLFILE= [bootloader, destination_cpu=a53-0] %TOPDIR%/sdk_workspace/system_wrapper/export/system_wrapper/sw/system_wrapper/boot/fsbl.elf
set BITFILE= [destination_device=pl] %TOPDIR%/sdk_workspace/vitis_proj/_ide/bitstream/system_wrapper.bit
set ELFFILE= [destination_cpu = a53-0] %TOPDIR%/sdk_workspace/vitis_proj/Debug/vitis_proj.elf

:: (echo //arch = zynq; split = false; format = BIN & echo the_ROM_image: & echo { & echo %FSBLFILE% & echo %BITFILE% & echo %ELFFILE% & echo }) > ..\bootimage\vitis_proj.bif
:: bootgen -image ..\bootimage\vitis_proj.bif -arch zynq -o ..\bootimage\BOOT.bin -w on 

(echo //arch = zynqmp; split = false; format = BIN & echo the_ROM_image: & echo { & echo %FSBLFILE% & echo %BITFILE% & echo %ELFFILE% & echo }) > ..\bootimage\vitis_proj.bif
:: pause

::pwd
::pause
echo bootgen -image ..\bootimage\vitis_proj.bif -arch zynqmp -o ..\bootimage\BOOT.bin -w on | cmd

:: pause
cd %top%

:: pause
:: ref to msys2_shell.cmd
if exist output/ (
    ::echo exist outputdir
    rmdir /s/q output
)
:: pause
mkdir output

:: copy /b .\sdk_workspace\vitis_proj\_ide\flash\BOOT.bin .\output\app.bin
:: copy /b .\sdk_workspace\vitis_proj\_ide\bitstream\download.bit .\output
copy /b .\sdk_workspace\system_wrapper\export\system_wrapper\sw\system_wrapper\boot\fsbl.elf .\output
copy /b .\sdk_workspace\vitis_proj\_ide\bootimage\BOOT.bin .\output\BOOT.bin
:: pause

:: cmd /c call calc_size.bat | cmd /c
:: echo call calc_size.bat | cmd /c

set PATH=D:\msys64\usr\bin;%PATH%

:: bash -i -c "sleep 1 && du -b ./output/BOOT.bin | awk '{print substr($1,$2)}' | xargs -I {} printf '%x\n' {} "> .\output\BOOT.txt
:: bash -i -c "sleep 1 && du -b ./output/BOOT.bin | awk '{print substr($1,$2)}' "
:: set TMP1=du -b ./output/BOOT.bin 
:: set TMP2=awk '{print substr($1,$2)}' 
:: set TMP3=xargs -I {} printf '%x\n' {} 
:: FOR /F "tokens=*" %%g IN ('bash -i -c "%TMP1%|%TMP2%"') do (SET VAR=%%g)
:: printf %%x %VAR% > .\output\BOOT.txt
:: printf --help

bash -i -c "sleep 1 && du -b ./output/BOOT.bin | awk '{print substr($1,$2)}' | xargs -I {} printf %%x {} " > .\output\BOOT.txt

pause
