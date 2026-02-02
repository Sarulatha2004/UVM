class mem_seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(mem_seq_item)
  
  bit clk;
  rand bit r_w;
  rand bit [3:0]addr;
  rand bit [7:0]wdata;
  bit [7:0]rdata;
  
  constraint cons1 {addr>0; addr<10;}
  
  
  function new(name="mem_seq_item");
    super.new(name);
  endfunction
  
  
  
endclass
