   /*
  *  Text Encrypter / Decrytper
  *  All code written by : Derek Cresswell
  */
  
  void setup(){
    //encrypt("Kk Aa", "abc");
    
    int[][] test = new int[][]{
      {2, 4},
      {5, 3},
      {3, 5}
    };
    int[][] test2 = new int[][]{
      {3, 4, 2},
      {5, 1, 2}
    };

    //int[][] test3 = multiplyMatrices(test, test2);
    
    //for(int i = 0; i < test3.length; i++){
    //  for(int j = 0; j < test3[i].length; j++){
    //    System.out.print(test3[i][j] + ", ");
    //  }
    //  System.out.println();
    //}
    
  }
  
  String encrypt(String text, String pass){
      String toRet = "";
      int[] textArr = stringToIntArr(text);
      int[] passArr = stringToIntArr(pass);
      
      int[] size = findDimensions(textArr.length, passArr.length);
      
      int[][] textMat = arrToMatrix(textArr, size[0], size[1]);
      int[][] passMat = arrToMatrix(passArr, size[1], size[2]);
      int[][] result = multiplyMatrices(textMat, passMat);
      
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
        
         if(count < arr.length){
           //ensure working ^
           toRet[i][j] = arr[count];
         } else {
           toRet[i][j] = 0;
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
  
  int[] findDimensions(int num1, int num2){
    //Returns an array with the values for the matrices size
    //Indices : mat1[0][1], mat2[1][2]
    
    int[] toRet = new int[3];
    int[] result;
    
    if(num1 % 2 != 0)
      num1++;
      
    if(num2 % 2 != 0)
      num2++;
      
    result = findDivisors(num1);
    toRet[0] = result[1];
    toRet[1] = result[0];
    toRet[2] = num2 / result[0];
    
    return toRet;
  }
  
  int[] findDivisors(int n){
    //toRet[0] is the lesser number
    
    int[] toRet = new int[2];
    
    for(int i = 1; i <= Math.sqrt(n); i++){
      if(n % i == 0){
        
        if(n / i == i){
          toRet[0] = i;
          toRet[1] = i;
        } else {
          toRet[0] = i;
          toRet[1] = n / i;
        }
        
      }
    }
    
    return toRet;
  }
  
  
