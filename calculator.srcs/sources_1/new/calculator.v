`timescale 1ns / 1ps

module calculator( input clk,rst,B1,B2,B3,B4,B5,B6, B7,B8,B9,output [6:0] seg,output [3:0] anodes,output reg dp); //B1,B2,B3,B4,B5,B6,B7,B8,B9,
//
    reg [6:0] first_num,second_num ; //storing first and second numbers e.g 24 and 99 
    reg [7:0] sum,sub; //storing the result of sum or subtraction
    reg [6:0] division,div,division1,division2 ; //storing the result of division
    reg [13:0] mult ; //storing the result of multiplication
    wire [3:0] first,second,third,fourth;

    reg [3:0] first1,second2,third3,fourth4; //1st,2nd,3rd,4th digits of the result
    wire [1:0]sel_out;
    reg [3:0]dn; //displayed_number// dot
    reg opcount;

    
    posedgecntrl Bo1(clk,rst,B1,first);
    posedgecntrl Bo2(clk,rst,B2,second);
    posedgecntrl Bo3(clk,rst,B3,third);
    posedgecntrl Bo4(clk,rst,B4,fourth);
    initial begin
    opcount = 0;
    first1=0;
    second2=0 ;
    third3=0;
    fourth4= 0;
    end
    
   
    SelectCounter counter(clk,rst,1'b1,sel_out);
    
    always @(sel_out, rst, first, second, third, fourth, first1, second2, third3, fourth4, B9)
    begin
        if (rst) begin
            opcount = 0;
            dn = 4'b0000;
        end
        
       else if ((B5 | B6 | B7 | B8 )& !B9) begin
            opcount = 1;
            case(sel_out)
                0 : dn = first1;              
                1 : dn = second2;
                2 : dn = third3;
                3 : dn = fourth4;
            endcase
            case(sel_out)
                0 : dp = 1;              
                1 : dp = 1;
                2 : dp = 1;
                3 : dp = 1;
            endcase
       end
        else if (B9 |!opcount) begin
            case(sel_out)
                0 : dn = first;              
                1 : dn = second;
                2 : dn = third;
                3 : dn = fourth;
            endcase
            case(sel_out)
                0 : dp = 1;              
                1 : dp = 0;
                2 : dp = 1;
                3 : dp = 1;
            endcase
       end 
          else if (!B9 && !B8 && !B7 && !B6 && !B5 ) begin
            case(sel_out)
                0: dn = first;              
                1 : dn = second;
                2 : dn = third;
                3 : dn = fourth;
            endcase
            case(sel_out)
                0 : dp = 1;              
                1 : dp = 0;
                2 : dp = 1;
                3 : dp = 1;
            endcase
       end 
       
     
       
    
    end 
    wire [3:0] dn1 = dn;

    sevenseg DUT_12(sel_out, dn1 ,seg, anodes);
    
    

always @ (  B5,  B6,  B7,  B8)
 begin
    first_num = first*10+second;
    second_num = third*10+fourth;
 
 if (B7 & !B5& !B6 & !B8) 
    begin/*mult*/
      
//        first_num = first*10+second;
//        second_num = third*10+fourth;
        mult= first_num*second_num ;
        fourth4=mult%10 ;
        mult=mult/10 ;
        third3=mult%10;
        mult=mult/10;
        second2=mult%10;
        mult=mult/10;
        first1= mult%10; 
    end
   else if (B5 & !B7 & !B6 & !B8)
   begin /*add */
//    first_num = first*10+second;
//    second_num = third*10+fourth;
    sum = first_num+second_num ;
     fourth4=sum%10 ;
     sum=sum/10 ;
     third3=sum%10;
     sum=sum/10;
     second2=sum%10;
     first1 = 0; 
     
      end 
    
  
  

  
     else if (B6 & !B8 & !B5 & !B7 & first_num >= second_num )
     begin/*sub*/
     
//     first_num = first*10+second;
//    second_num = third*10+fourth;
     sub = first_num-second_num ;
     fourth4=sub%10 ;
     sub=sub/10 ;
     third3=sub%10;
     sub=sub/10;
     second2=0;
     first1=0; 
    
     end
     
     
       else if (B6 & !B8 & !B5 & !B7 & first_num < second_num )
     begin/*sub*/
     
//     first_num = first*10+second;
//    second_num = third*10+fourth;
     sub = second_num-first_num ;
     fourth4=sub%10 ;
     sub=sub/10 ;
     third3=sub%10;
     sub=sub/10;
     second2=0;
     first1=15; 
    
     end
     
    
  
    else if (B8 & !B5 & !B7 & !B6) 
        begin/*division*/
        if(second_num == 0) begin  //catching division by zero
            first1 = 14;
            second2 = 14;
            third3 = 14;
            fourth4 = 14;
        end
        
    //    first_num = first*10+second;
    //    second_num = third*10+fourth;
        else begin    
            division= ((first_num*10)/second_num) ;
            div=division%10 ;
            if (div < 5) begin 
                division1=first_num/second_num;
                fourth4=division1%10 ;
                division1=division1/10 ;
                third3=division1%10;
                division1=division1/10;
                second2=0;
                first1= 0; 
            end
            else begin
                division2 =((((first_num*10)/second_num)+10)/10)  ;
                fourth4=division2%10 ;
                division2=division2/10 ;
                third3=division2%10;
                division2=division2/10;
                second2=0;
                first1= 0; 
           end
        end
    end
      

    

 end 


   
endmodule
