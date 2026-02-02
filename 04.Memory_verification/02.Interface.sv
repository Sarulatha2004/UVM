interface mem_if;
  logic clk;
  logic r_w;
  logic [3:0]addr;
  logic [7:0]wdata;
  logic [7:0]rdata;
endinterface
