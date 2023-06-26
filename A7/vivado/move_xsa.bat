@echo off
cls
cd vivado_proj
set source_file=%cd%\system_wrapper.xsa
echo source_file=%source_file%

cd ../../
set destination_file=%cd%\vitis\xsa\
echo %destination_file%



if exist %source_file% (
    echo %source_file% is  exist!
    xcopy %source_file% %destination_file% /f /y
) else (
    echo %SourceFile% is not exist!
)

rem Check whether the copy was successful
set err=%ERRORLEVEL%
IF %err%==1 goto :FAIL
goto :SUCCESS

:FAIL
echo faild,!!!!!!Check, please!!!!

:SUCCESS
echo successed!!

pause

