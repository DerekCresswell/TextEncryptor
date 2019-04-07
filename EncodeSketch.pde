  /*
  *  Text Encrypter / Decrytper
  *  All code written by : Derek Cresswell
  */
  
  void setup(){
    //encrypt("Kk Aa", "abc");
    //arrToMatrix(stringToIntArr("Kk Aa"), 3, 2);
    //arrToMatrix(stringToIntArr("Kk Aa"), 2, 3);
    
    int[][] test = new int[][]{
      {2, 4},
      {5, 3},
      {3, 5}
    };
    int[][] test2 = new int[][]{
      {3, 4, 2},
      {5, 1, 2}
    };

    int[][] test3 = multiplyMatrices(test, test2);
    
    for(int i = 0; i < test3.length; i++){
      for(int j = 0; j < test3[i].length; j++){
        System.out.print(test3[i][j] + ", ");
      }
      System.out.println();
    }
    
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
      String toRet = "";
      int[] textArr = stringToIntArr(text);
      int[] passArr = stringToIntArr(pass);
      
      return toRet;
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
  /*
  *Shoud need to be doubles for inverse matrices
  */
  
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
  /*
  *Should need to be doubles for inverse matrices
  */
  
  int [][] multiplyMatrices(int[][] arr1, int[][] arr2){
    //Multiplies two given matrices
    //All rows must have the same length
    
    int[][] toRet = new int[arr1.length][arr2[0].length];

    for(int i = 0; i < arr1.length; i++){
      for(int j = 0; j < arr2[0].length; j++){
        for(int k = 0; k < arr1[0].length; k++){
          toRet[i][j] += arr1[i][k] * arr2[k][j];
        }
      }
    }
    
    return toRet;
  }
  /*
  * Invalid matrix resolution
  * Should need to be doubles for inverse matrices
  */
  
  
  
  
  
  
