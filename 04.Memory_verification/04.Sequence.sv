class mem_sequence extends uvm_sequence#(mem_seq_item);
  
  `uvm_object_utils(mem_sequence)
  
  function new(name="mem_sequence");
    super.new(name);
  endfunction
  
  task body();
    
    mem_seq_item req;
    
    `uvm_info("SEQ","Sequence starts",UVM_LOW)
    
    repeat(50) begin
    
    req= mem_seq_item::type_id::create("req");
    start_item(req);
    if(!req.randomize()) `uvm_error("SEQ", "Randomize failed");
      finish_item(req);
    end
    
  endtask
endclass
    
    
  
  
