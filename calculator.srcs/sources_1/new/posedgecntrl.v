`timescale 1ns / 1ps


module posedgecntrl( input clk,rst,B,output reg [3:0] out 
   );
     reg push_1;
     reg push_2;
     reg push_3;
     wire push_4;
     
    
   always@(posedge clk )begin
       push_1<= B;
       push_2<= push_1;
   end 
   always@(posedge clk , posedge rst ) begin 
       if (rst)begin 
           push_3=1'b0;
       end
       else begin
           push_3 <=push_2 ; 
       end
   end
   
   assign push_4 = push_2 & ~push_3 ;
   
   always @(posedge clk,posedge rst) begin 
        if (rst)begin 
            out <= 0 ;
        end
        else if(push_4)begin
            if(out!=9)
                out<=out+1;
            else
                out<=0;
       end
   end
   
     
     
endmodule
