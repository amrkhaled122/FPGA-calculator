`timescale 1ns / 1ps


module calcstim(

    );
   
      // 1. Adjust the two numbers to 99: If your 7 segment display starts by displaying "00.00" 
     //(The dot is always on when displaying the original two numbers), use B1, B2, B3 and B4 to 
     //it to "99.99" (meaning that both numbers are 99). You will need to press 
    //B1 9 times then B2, B3 and finally B4. 
    //2. Multiplication: Press B7 and the result displayed should be 9801 
    //3. Addition: Press B5 and the result displayed should be 198 
    //4. Subtraction: Press B6 and the result displayed should be 0. 
    //5. Division: Press B8 and result displayed should be 1. 
    //6. Display the original numbers: Press B9 to display the original numbers "99.99" 
    //7. Adjust the second number to be 98: Using B4, adjust the second number's ones to 8. 
    //Result displayed should be "99.98" 
    //8. Subtraction: Press B6 and the result displayed should be 1 
    //9. Division: Press B8 and the result displayed should be 1 
    //10. Display the original numbers: Press B9 to display the original numbers "99.98" 
    //11. Adjust the 1st number to 32: Using B1 and B2. Result displayed should be "32.98". 
    //12. Subtraction: Press B6 and the result displayed should be "-66" 
    //13. Division: Press B8. Result: "0" 
    //14. Multiplication: B7. Result: "3136" 
    //15. Display the original numbers: Press B9 to display the original numbers "32.98" 
    //16. Adjust the 2nd number to 10: Using B3 and B4. Result: "32.10". 
    //17. Division: B8. Result: "3"
    
endmodule
