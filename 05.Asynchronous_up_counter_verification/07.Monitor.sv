

class cntr_monitor extends uvm_monitor;
  
  `uvm_component_utils(cntr_monitor)
  
  virtual cntr_if vif;
  cntr_seq_item item;
  
  uvm_analysis_port #(cntr_seq_item)mon_ap;
  
  function new(string name="monitor", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    mon_ap=new("mon_ap",this); 
    if(!uvm_config_db #(virtual cntr_if)::get(this,"","vif",vif))
      `uvm_fatal("MONITOR","Virtual interface not found")
  endfunction
  
  task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    
    
    forever begin
      
      @(posedge vif.clk);
       #1; 

      item=cntr_seq_item:: type_id:: create("item");


      item.rst = vif.rst;
      item.en   = vif.en;
      item.count  = vif.count;

      
      mon_ap.write(item);
    end
  endtask
endclass
