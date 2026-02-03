class cntr_seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(cntr_seq_item)
  
  bit clk;
  bit rst;
  rand bit en;
  bit [3:0]count;
 
  
  function new( string name="cntr_seq_item");
    super.new(name);
  endfunction
  
  
  
endclass
