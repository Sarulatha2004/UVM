module mem(
  input logic clk,
  input logic r_w,
  input logic [3:0]addr,
  input logic [7:0]wdata,
  output logic [7:0] rdata
);
  logic [7:0]mem[15:0];
  
  always @(posedge clk)
    begin
      if(r_w)
        mem[addr]<=wdata;
      else
        rdata<=mem[addr];
    end
endmodule
        
