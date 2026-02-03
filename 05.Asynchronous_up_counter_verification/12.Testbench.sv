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
  
  cntr_if vif();
  
  counter dut(.clk(vif.clk),
          .rst(vif.rst),
              .en(vif.en),
              .count(vif.count)
        );
  
  initial begin
    
    uvm_config_db#(virtual cntr_if)::set(null,"*","vif",vif);
    
    run_test ("cntr_test");
  end
  always #5 vif.clk=~vif.clk;
  
  initial begin
    
    $dumpfile("counter_UVM.vcd");
    $dumpvars;
    vif.clk=0;
    vif.rst=1;
    
    #100;
    vif.rst=0;
    
    #300;
    
    $finish;
    
  end
endmodule
