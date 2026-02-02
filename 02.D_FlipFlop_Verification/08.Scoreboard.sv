class dff_scoreboard extends uvm_scoreboard;
  
  
  `uvm_component_utils(dff_scoreboard)
  
  uvm_analysis_imp #(dff_seq_item,dff_scoreboard) sb_imp;
  
  function new(string name="scoreboard", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp=new("sb_imp",this);
  endfunction
  
  
  function void write(dff_seq_item item);

  bit exp_q;

 
  if(item.rst) begin
    exp_q = 0;   
  end

  else begin
    exp_q = item.d;
  end

  if(exp_q === item.q)
    `uvm_info("SB",
      $sformatf("PASS -> rst=%0b d=%0b | DUT_q=%0b EXP_q=%0b",
      item.rst,item.d,item.q,exp_q),
      UVM_LOW)
  else
    `uvm_error("SB",
      $sformatf("FAIL -> rst=%0b d=%0b | DUT_q=%0b EXP_q=%0b",
      item.rst,item.d,item.q,exp_q))

endfunction

  
endclass
  
  
  
  
  
  
  
