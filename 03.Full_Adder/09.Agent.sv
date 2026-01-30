

class FA_agent extends uvm_agent;
  
  `uvm_component_utils(FA_agent)
  
  FA_driver drvr;
  FA_monitor montr;
  FA_sequencer seqncr;
  
  function new(string name="Agent", uvm_component parent);
    super.new(name, parent);
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    
    seqncr=FA_sequencer:: type_id :: create("seqncr", this);    
    drvr=FA_driver::type_id::create("drvr",this);
    montr=FA_monitor:: type_id :: create("montr",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drvr.seq_item_port.connect(seqncr.seq_item_export);
  endfunction
  
endclass
