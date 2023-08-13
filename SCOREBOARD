class scoreboard;
 
  mailbox #(transaction) mbx;
  transaction trans;
  event next;
 
  
  bit [7:0] din[$];
  bit [7:0] temp;
  
   function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    forever begin
      mbx.get(trans);
      trans.display("SCO");
      
      if(trans.wr)
        begin
          din.push_front(trans.data_in);
          $display("data store in queue %0d",trans.data_in);
        end
      
      if(trans.rd)
        begin
          if(trans.empty == 0)
            begin
              temp = din.pop_back();
              
              if(trans.data_out == temp)
                $display("[SCO] Data is matched");
              else
                $display("[SCO] Data is mismatched");
            end
          else
            begin
            $display("FIFO is empty");
            end
          
        end
      -> next;
    end
  endtask
  
  
endclass
