import uvm_pkg::*;          
`include "uvm_macros.svh"

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module top;
  
  mem_if vif();
  
  mem dut(.clk(vif.clk),
          .r_w(vif.r_w),
          .addr(vif.addr),
          .wdata(vif.wdata),
          .rdata(vif.rdata)
        );
  
  initial begin
    
    uvm_config_db#(virtual mem_if)::set(null,"*","vif",vif);
    
    run_test ("mem_test");
  end
  always #5 vif.clk=~vif.clk;
  
  initial begin
    
    $dumpfile("mem_UVM.vcd");
    $dumpvars;
    vif.clk=0;
    
    #500;
    
    $finish;
    
  end
endmodule
