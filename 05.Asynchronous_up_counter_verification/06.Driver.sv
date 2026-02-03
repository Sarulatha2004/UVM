class cntr_driver extends uvm_driver#(cntr_seq_item);
  
  `uvm_component_utils(cntr_driver)
  
  
  virtual cntr_if vif;
  cntr_seq_item req;
  
  function new(string name="cntr_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db  #(virtual cntr_if)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER","Virtual interface not found");
  endfunction
      
  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);

  forever begin
    req=cntr_seq_item::type_id::create("req");

    seq_item_port.get_next_item(req);

    @(negedge vif.clk);     

    vif.en   <= req.en;

    @(posedge vif.clk);  
    #10;

    seq_item_port.item_done();

  end

endtask

endclass
    
        
