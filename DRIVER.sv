class driver;
  virtual fifo_if fif;
  mailbox #(transaction) mbx;
  transaction trans;
  
  event next;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task reset();
    fif.rst <= 1;
    fif.rd <= 0;
    fif.wr <= 0;
    fif.data_in <= 0;
    
    repeat(5) @(posedge fif.clock);
      fif.rst <= 0;
    $diisplay("DUT reset done");
    
    
  endtask
  
  task run();
    forever begin
      mbx.get(trans);
      trans.display("DRV");
      fif.rd <= trans.rd;
      fif.wr <= trans.wr;
      fif.data_in <= trans.data_in;
      repeat(2) @(posedge fif.clock);
      ->next;
    end
  endtask

endclass
