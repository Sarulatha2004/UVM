

class cntr_agent extends uvm_agent;
  
  `uvm_component_utils(cntr_agent)
  
  cntr_driver drvr;
  cntr_monitor montr;
  cntr_sequencer seqncr;
  
  function new(string name="Agent", uvm_component parent);
    super.new(name, parent);
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    
    seqncr=cntr_sequencer:: type_id :: create("seqncr", this);    
    drvr=cntr_driver::type_id::create("drvr",this);
    montr=cntr_monitor:: type_id :: create("montr",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drvr.seq_item_port.connect(seqncr.seq_item_export);
  endfunction
  
endclass
