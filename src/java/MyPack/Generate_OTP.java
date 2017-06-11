/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MyPack;

import java.util.Random;

/**
 *
 * @author win 8
 */
public class Generate_OTP 
{
 public static String get_OTP()
    { String res="";
      Random rand = new Random();
      int range = rand.nextInt((8 - 4) + 1) + 4;
    
      int c=0;
      int i,randomNum;
      
      char abcd[]=new char[36];
      for(i=65;i<=90;i++)
          abcd[c++]=(char)(i);
      abcd[26]='0';
      abcd[27]='1';
      abcd[28]='2';
      abcd[29]='3';
      abcd[30]='4';
      abcd[31]='5';
      abcd[32]='6';
      abcd[33]='7';
      abcd[34]='8';
      abcd[35]='9';
      
     for(i=1;i<=range;i++)
     {  randomNum = rand.nextInt((35 - 0) + 1) + 0;
         res=res+abcd[randomNum];
     }
      return res;
    
    }
}
