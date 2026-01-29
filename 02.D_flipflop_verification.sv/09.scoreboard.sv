class dff_scoreboard extends uvm_scoreboard;
  
  
  `uvm_component_utils(dff_scoreboard)
  
  uvm_analysis_imp #(dff_seq_item,dff_scoreboard) sb_imp;
  bit pre_d=0;
   
  
  function new(string name="scoreboard", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp=new("sb_imp",this);
  endfunction
  
  function void write(dff_seq_item item);
    bit exp_rst;
  
    bit exp_q;
      
    if(exp_rst)
        exp_q=0;
      else
        exp_q=pre_d;
    
    
    if(exp_q==item.q)
      `uvm_info("SB",$sformatf("PASS----> INPUT:clk=%0b |rst=%0b|d=%0b|Actual output: q=%0b|| Expected output: q=%0b",item.clk,item.rst,item.d,item.q,exp_q),UVM_LOW)
    else
      `uvm_error("SB",$sformatf("PASS----> INPUT:clk=%0b |rst=%0b|d=%0b|Actual output: q=%0b|| Expected output: q=%0b",item.clk,item.rst,item.d,item.q,exp_q))
      
      pre_d=item.d;
  endfunction
  
endclass
  
  
  
  
  
  
  
