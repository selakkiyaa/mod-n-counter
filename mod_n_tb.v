module mod_n_tb;

    parameter N = 10;          
    reg clk;                   
    reg reset;                 
    wire [$clog2(N)-1:0] count; 

    mod_n #(.N(N)) uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%d", $time, reset, count);
        reset = 1; #10;
        reset = 0;
        #100;
        $stop;
    end

endmodule
