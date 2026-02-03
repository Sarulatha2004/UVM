class cntr_test extends uvm_test;
  
  `uvm_component_utils(cntr_test)
  
  cntr_env env;
  cntr_sequence seq;

  function new(string name="test", uvm_component parent);
    super.new(name, parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    env=cntr_env:: type_id::create("env",this);
    seq=cntr_sequence::type_id::create("seq");

  endfunction
  
  task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    
    phase.raise_objection(this);
    
    
    seq.start(env.agent.seqncr);
    
    #200;
    
    phase.drop_objection(this);
    
  endtask
endclass
