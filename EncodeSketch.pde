  
  import java.util.*;
  
  void setup(){
    encrypt("Kk Aa", "abc");
    arrToMatrix(stringToIntArr("Kk Aa"), 3, 2);
    arrToMatrix(stringToIntArr("Kk Aa"), 2, 3);
  }
  
  String encrypt(String text, String pass){
      String toRet = "";
      int[] textArr = stringToIntArr(text);
      int[] passArr = stringToIntArr(pass);
    
      
    
      return toRet;
  }
  /*
  *Empty string catches;
  */
  
  String decrypt(String text, String pass){
  
      return "";
  }
  /*
  *
  */
  //End Main Func
  
  //Start Helper Func
  int[] stringToIntArr(String text){
    //Converts string to int array of ASCII values
    
      int[] toRet = new int[text.length()];
    
      for(int i = 0; i < text.length(); i++){
        toRet[i] = (int) text.charAt(i);
      }
    
      return toRet;
  }
  
  int[][] arrToMatrix(int[] arr, int row, int col){
    //Converts int array to 2D array of row rows and col columns 
    //0's are substituded if the array is too short
    //If the array is too long the extra values are not used
    
    int[][] toRet = new int[row][col];
    int count = 0;
    
    for(int i = 0; i < row; i++){   
      for(int j = 0; j < col; j++){
        
         if(count >= arr.length){
           toRet[i][j] = 0;
         } else {
           toRet[i][j] = arr[count];
         }
         
         count++;
      }  
    }
    
    return toRet;
  }
  
  int [][] multiplyMatrices(int[][] arr, int[][] arr2){
    //Multiplies two given matrices
    //All rows must have the same length
    //[a][b] [c][d]; b == c; New size a x d
    
    int[][] toRet = new int[arr.length][arr2[0].length];
    
    if(toRet.length == toRet[0].length){
      //[i][j] x [k][l]
      for(int i = 0; i < toRet.length; i++){
        
      }
    }
    
    return toRet;
  }
  /*
  * Invalid matrix resolution
  */
  
  
  
  
  
  
