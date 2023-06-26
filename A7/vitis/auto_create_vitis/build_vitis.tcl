set tclPath [pwd]
cd $tclPath
cd ..
set hardware_path [pwd]/xsa
set codepath [pwd]/src
set projpath [pwd]/sdk_workspace
puts "Current workspace is $projpath"
setws $projpath	
getws
set xsaName system_wrapper
set appName vitis_proj

#Create a new platform
platform create -name $xsaName -hw $hardware_path/$xsaName.xsa -proc psu_cortexa53_0 -os standalone -arch 64-bit -out $projpath
cd $projpath
importprojects $xsaName
platform active $xsaName
repo -add-platforms $xsaName
importsources -name $xsaName/zynqmp_fsbl -path $codepath/fsbl -target-path ./

domain active
#Create a new application
app create -name $appName -platform $xsaName -domain standalone_domain -template "Empty Application"
importsources -name $appName -path $codepath/$appName/src

#bsp setting
#bsp setdriver -ip psu_dp -driver dppsu -ver 1.2

bsp config stdin axi_uartlite_0
bsp config stdout axi_uartlite_0

bsp setlib -name xilffs
bsp config fs_interface 2

bsp setlib -name lwip211
bsp config lwip_dhcp false
bsp config mem_size 134217728
bsp config memp_n_pbuf 4096
bsp config memp_n_tcp_pcb 1024
bsp config memp_n_tcp_seg 1024
bsp config pbuf_pool_size 4096
bsp config tcp_snd_buf 65536
bsp config tcp_wnd 8192

bsp regenerate

#Build platform project
platform generate
#Build application project
append appName "_system"
sysproj build -name $appName
