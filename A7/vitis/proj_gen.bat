@echo off

:: rmdir /s/q .Xil
:: del *.log *.jou

set PATH=D:\msys64\usr\bin;%PATH%
bash -i -c "source clean.sh -b -w"

call D:\Xilinx\Vitis\2020.1\bin\xsct.bat create_SW_proj.tcl

bash -i -c "source clean.sh -b"
pause

