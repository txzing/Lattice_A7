@echo off

:: rmdir /s/q .Xil
:: del *.log *.jou

set PATH=D:\msys64\usr\bin;%PATH%
:: bash -i -c "source clean.sh -b -w"
bash -i -c "source clean.sh -b"