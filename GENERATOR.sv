class generator;
  transaction trans;
  mailbox #(transaction) mbx;
  int count = 0;
  event next;
  event done;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
    trans = new();
  endfunction
  
  task run();
    repeat(count)
      begin
      assert(trans.randomize()) else $display("Randomization Failed");
      mbx.put(trans.copy);
      trans.display("GEN");
      @(next);
    end
    ->done;
  endtask
   
endclass
