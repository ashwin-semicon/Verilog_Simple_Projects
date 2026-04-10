// Trafic light controller testbench
module Traffic_light_tb;
    reg clk, rst;
    wire [2:0] light;

    Tracfic_light uut(.clk(clk), .rst(rst), .light(light));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("Trafic_light.vcd");
        $dumpvars(0, Traffic_light_tb);
        $monitor("At time %t: rst = %b, light = %b, state=%b ", $time, rst, light, Traffic_light_tb.uut.state);
        
        #0 rst = 1; // Reset the system
        #10 rst = 0; // Release reset

        // Let the traffic light cycle through a few states
        #100 $finish; // End the simulation after some time
    end
endmodule