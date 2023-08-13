module tb;
  
  fifo_if fif();
  
  fifo dut (fif.clock, fif.wr, fif.rd,fif.full, fif.empty, fif.data_in, fif.data_out, fif.rst);
  
  initial begin
    fif.clock <= 0;
  end
  
  always #10 fif.clock <= ~fif.clock;
  
  environment env;
  
  initial begin
    env = new(fif);
    env.gen.count = 20;
    env.run();
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
