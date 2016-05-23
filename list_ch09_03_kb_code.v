//Listing 9.3
module kb_code
  // #(parameter W_SIZE = 2)  // 2^W_SIZE words in FIFO
   (
    input wire clk, reset,scan_done_tick,
    input wire [7:0] scan_out,
    output reg got_code_tick
   );

   // constant declaration
   localparam BRK = 8'hf0; // break code

   // symbolic state declaration
   localparam
      wait_brk = 1'b0,
      get_code = 1'b1;

   // signal declaration
   reg state_reg, state_next;

   //=======================================================
   // FSM to get the scan code after F0 received
   //=======================================================
   // state registers
   always @(posedge clk, posedge reset)
      if (reset)
         state_reg <= wait_brk;
      else
         state_reg <= state_next;

   // next-state logic
   always @*
   begin
      got_code_tick = 1'b0;
      state_next = state_reg;
      case (state_reg)
         wait_brk:  // wait for F0 of break code
            if (scan_done_tick==1'b1 && scan_out==BRK)
               state_next = get_code;
         get_code:  // get the following scan code
            if (scan_done_tick)
               begin
                  got_code_tick =1'b1;
                  state_next = wait_brk;
               end
      endcase
   end

endmodule
