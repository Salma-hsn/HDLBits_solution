module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
reg [3:0] Q_reg,Q_next;
always@(posedge clk,posedge areset)
begin
    if(areset) Q_reg<='b0;
    else Q_reg<=Q_next;
end
always@(*)
begin
    if(load) Q_next=data;
    else if (ena) Q_next={1'b0,Q_reg[3:1]};
    else Q_next=Q_reg;
    end
    assign q=Q_reg;
endmodule
