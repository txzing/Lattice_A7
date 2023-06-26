for Linux, 

Default installed path:
/opt/Xilinx/Vivado/2020.1

method 1:

clean folder and generate project only
./proj_gen.sh
clean folder and generate project then build bitmap
./proj_build.sh

method 2:

source setenv.sh  [!!!]
make project_clean
make project
...
make bitstream


for Windows

Default installed path:
D:\Xilinx\Vivado\2020.1\

install base msys2(bash, rm, make...)

method 1:
double click setenv_bash.bat, then in bash

./proj_gen.sh
./proj_build.sh

method 2:
double click setenv_bash.bat, then in bash

make project_clean
make project
...
make bitstream
