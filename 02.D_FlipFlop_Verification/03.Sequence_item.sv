class dff_seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(dff_seq_item)
  
  bit clk;
  rand bit rst;
  rand bit d;
  bit q;
  
  constraint cons1{ rst dist{0:=5 , 1:=5};}
  constraint cons2{ d dist{0:=5 , 1:=5};}
  
  function new(name="dff_seq_item");
    super.new(name);
  endfunction
  
  
  
endclass
