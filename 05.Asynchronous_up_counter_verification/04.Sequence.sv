class cntr_sequence extends uvm_sequence#(cntr_seq_item);
  
  `uvm_object_utils(cntr_sequence)
  
  function new( string name="cntr_sequence");
    super.new(name);
  endfunction
  
  task body();
    
    cntr_seq_item req;
    
    `uvm_info("SEQ","Sequence starts",UVM_LOW)
    
    repeat(10) begin
    
    req= cntr_seq_item::type_id::create("req");
    start_item(req);
    if(!req.randomize()) `uvm_error("SEQ", "Randomize failed");
      finish_item(req);
    end
    
  endtask
endclass
    
    
  
  
