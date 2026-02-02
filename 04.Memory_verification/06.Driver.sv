class mem_driver extends uvm_driver#(mem_seq_item);
  
  `uvm_component_utils(mem_driver)
  
  
  virtual mem_if vif;
  mem_seq_item req;
  
  function new(name="mem_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db  #(virtual mem_if)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER","Virtual interface not found");
  endfunction
      
  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);

  forever begin
    req=mem_seq_item::type_id::create("req");

    seq_item_port.get_next_item(req);

    @(negedge vif.clk);     

    vif.r_w   <= req.r_w;
    vif.addr  <=req.addr;
    vif.wdata <=req.wdata;
    

    @(posedge vif.clk);  
    #10;

    seq_item_port.item_done();

  end

endtask

endclass
    
        
