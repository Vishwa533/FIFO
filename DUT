module fifo(
  input clock,wr,rd,
  output full,empty,
  input [7:0] data_in,
  output reg [7:0] data_out,
  input rst
);
  
  reg [7:0] wr_ptr;
  reg [7:0] rd_ptr;
  reg [7:0] mem [31:0];
  
  always @(posedge clock)
    begin
      if(rst)
        begin
        
          wr_ptr <= 0;
          rd_ptr <= 0;
          data_out <= 0;
          
          for(int i=0;i<20;i++)begin
            mem[i] <= 0;
          end
        end
      else
        begin
          if((wr == 1) && (full == 0))
            begin
              mem[wr_ptr] <= data_in;
              wr_ptr = wr_ptr + 1;
            end
          if((rd == 1) && (empty == 0))
            begin
              data_out <= mem[rd_ptr];
              rd_ptr = rd_ptr + 1;
            end
        end
    end
  
  assign full = (wr_ptr - rd_ptr == 31)? 1'b1:1'b0;
  assign empty = (wr_ptr - rd_ptr == 0)? 1'b1:1'b0;
  
endmodule
