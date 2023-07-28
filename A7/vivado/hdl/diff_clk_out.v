module diff_clk_out(    
    input                 sys_clk_p ,           //系统差分输入时钟
    input                 sys_clk_n ,           //系统差分输入时钟

    output  wire          sys_clk      
    );
    

//转换差分信号
IBUFDS diff_clock
(
    .I (sys_clk_p),    //系统差分输入时钟
    .IB(sys_clk_n),    //系统差分输入时钟
    .O (sys_clk)       //输出系统时钟
); 

endmodule