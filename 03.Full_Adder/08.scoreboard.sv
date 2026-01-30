

class FA_scoreboard extends uvm_scoreboard;
  
  
  `uvm_component_utils(FA_scoreboard)
  
  uvm_analysis_imp #(FA_seq_item,FA_scoreboard) sb_imp;
  
  function new(string name="scoreboard", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp=new("sb_imp",this);
  endfunction
  
  function void write(FA_seq_item item);
    bit exp_sum;
    bit exp_carry;
    
    exp_sum=item.a^item.b^item.c;
    exp_carry=(item.a|item.b)&(item.b|item.c)&(item.c|item.a);
    
    
    if(exp_sum==item.sum && exp_carry==item.carry)
      `uvm_info("SB",$sformatf("PASS----> INPUT:a=%d |b=%d|c=%0d|Actual output: sum=%d |carry=%0b || Expected output:sum=%d |carry=%0b",item.a,item.b,item.c,item.sum,item.carry,exp_sum,exp_carry),UVM_LOW)
    else
      `uvm_error("SB",$sformatf("FAIL----> INPUT:a=%d |b=%d|c=%0d|Actual output: sum=%d |carry=%0b || Expected output:sum=%d |carry=%0b",item.a,item.b,item.c,item.sum,item.carry,exp_sum,exp_carry))
  endfunction
  
endclass
  
  
  
  
  
  
  
