class mem_scoreboard extends uvm_scoreboard;
  
  
  `uvm_component_utils(mem_scoreboard)
  
  uvm_analysis_imp #(mem_seq_item,mem_scoreboard) sb_imp;
  
  function new(string name="scoreboard", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp=new("sb_imp",this);
  endfunction
   bit [7:0] exp_mem[15:0];
  bit [7:0]exp_rdata;
  

  
  function void write(mem_seq_item item);

    if(item.r_w) begin
      exp_mem[item.addr] = item.wdata;  
      
      `uvm_info("SB",$sformatf("WRITE DATA--->r_w=%0b | addr=%0b | wdata=%0b",item.r_w,item.addr,item.wdata),UVM_LOW);
  end

  else begin
    exp_rdata =exp_mem[item.addr];
    `uvm_info("SB",$sformatf("READ DATA-->r_w=%0b | addr=%0b | rdata=%0b",item.r_w,item.addr,exp_rdata),UVM_LOW);
    
    if(exp_rdata === item.rdata)
      `uvm_info("SB","TEST CASE PASS",UVM_LOW)
    else
      `uvm_error("SB","TEST CASE FAIL")
      end

endfunction

  
endclass
  
  
  
  
  
  
  
