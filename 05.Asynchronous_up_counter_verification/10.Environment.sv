class cntr_env extends uvm_env;
  
  `uvm_component_utils(cntr_env);
  
  cntr_agent agent;
  cntr_scoreboard sb;
  
  function new(string name="environment", uvm_component parent);
    super.new(name, parent);
    
    `uvm_info("ENV", "Environment Created", UVM_LOW)
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    
    agent= cntr_agent:: type_id ::create("agent",this);
    
    sb=cntr_scoreboard::type_id:: create("sb",this);
    
  endfunction
  
  function void  connect_phase (uvm_phase phase);
    
    super.connect_phase(phase);
    
    agent.montr.mon_ap.connect(sb.sb_imp);
    
  endfunction
  
endclass
