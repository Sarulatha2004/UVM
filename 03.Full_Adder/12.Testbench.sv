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
  
  FA_if vif();
  
  FA dut(.a(vif.a),
         .b(vif.b),
         .c(vif.c),
         .sum(vif.sum),
         .carry(vif.carry)
        );
  
  initial begin
    
    uvm_config_db#(virtual FA_if)::set(null,"*","vif",vif);
    
    run_test ("FA_test");
  end
  
  initial begin
    
    $dumpfile("FA_UVM.vcd");
    $dumpvars;
    
    #100;
    
    $finish;
    
  end
endmodule
