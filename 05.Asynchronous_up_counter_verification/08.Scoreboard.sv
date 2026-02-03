class cntr_scoreboard extends uvm_scoreboard;
  
  
  `uvm_component_utils(cntr_scoreboard)
  
  uvm_analysis_imp #(cntr_seq_item,cntr_scoreboard) sb_imp;
  
  function new(string name="scoreboard", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp=new("sb_imp",this);
  endfunction
  
  
   bit [3:0]exp_count;
  function void write(cntr_seq_item item);
 
  if(item.rst) begin
    exp_count =0;   
  end
  
    else if(item.en) begin
      exp_count =exp_count+1;
    end
    
  else begin
    exp_count =exp_count ;
  end

    if(exp_count === item.count)
    `uvm_info("SB",
              $sformatf("PASS -> rst=%0b en=%0b | DUT_count=%0d EXP_count=%0d",
      item.rst,item.en,item.count,exp_count),
      UVM_LOW)
  else
    `uvm_error("SB",
               $sformatf("FAIL -> rst=%0b en=%0b | DUT_q=%0d EXP_q=%0d",
      item.rst,item.en,item.count,exp_count))

endfunction

  
endclass
  
  
  
  
  
  
  
