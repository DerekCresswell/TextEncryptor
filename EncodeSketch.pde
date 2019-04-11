  /*
  *  Text Encrypter / Decrytper
  *  All code written by : Derek Cresswell
  */
  
  void setup(){
    //System.out.println(encrypt("Kk Aa", "abc"));

    int[][] test = new int[][]{
      {34, 54},
      {57, 110},
      {33, 75}
    };
    int[][] test2 = new int[][]{
      {78, 46},
      {65, 100},
      {89, 46}
    };

    int[][] test3 = subtractMatrices(test, test2);
    
    for(int i = 0; i < test3.length; i++){
      for(int j = 0; j < test3[i].length; j++){
        System.out.print(test3[i][j] + ", ");
      }
      System.out.println();
    }
    System.out.println();
    
    test3 = cycleMatrixInc(test3, 32, 126);
    
    for(int i = 0; i < test3.length; i++){
      for(int j = 0; j < test3[i].length; j++){
        System.out.print(test3[i][j] + ", ");
      }
      System.out.println();
    }
    System.out.println();
    
    test3 = addMatrices(test3, test2);
    test3 = cycleMatrixInc(test3, 32, 126);
    
    for(int i = 0; i < test3.length; i++){
      for(int j = 0; j < test3[i].length; j++){
        System.out.print(test3[i][j] + ", ");
      }
      System.out.println();
    }
    
  }
  
  String encrypt(String text, String pass){
      int[] textArr = stringToIntArr(text);
      int[] passArr = stringToIntArr(pass);
      
      int[] size = findDimensions(textArr.length, passArr.length);
      
      int[][] textMat = arrToMatrix(textArr, size[0], size[1]);
      int[][] passMat = arrToMatrix(passArr, size[0], size[1]);
      int[][] result = subtractMatrices(textMat, passMat);
      textMat = cycleMatrixInc(textMat, 32, 126);
      
      textArr = matToIntArr(result);
      text = arrToString(textArr);
      
      return text;
      //Ensure all is working
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
    //Setup for add/sub
    
    int[] toRet = new int[2];
    
    if(num1 % 2 != 0)
      num1++;
      
    if(num2 % 2 != 0)
      num2++;
   
   if(num1 > num2){
     toRet = findDivisors(num1);
   } else {
     toRet = findDivisors(num2);
   }
    
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
  
  int[] matToIntArr(int[][] mat){
    int[] toRet = new int[mat.length * mat[0].length];
    int count = 0;
    
    for(int i = 0; i < mat.length; i++){
      for(int j = 0; j < mat[i].length; j++){
        toRet[count] = mat[i][j];
      }
    }
    
    return toRet;
  }
  
  String arrToString(int[] arr){
    String toRet = "";
    
    for(int i = 0; i < arr.length; i++){
      toRet = toRet + Character.toString((char) i);
    }
    
    return toRet;
  }
  
  int[][] subtractMatrices(int[][] mat1, int[][] mat2){  
    for(int i = 0; i < mat1.length; i++){
      for(int j = 0; j < mat1[i].length; j++){
        mat1[i][j] -= mat2[i][j];
      }
    }
    
    return mat1;
  }
  
  int[][] addMatrices(int[][] mat1, int[][] mat2){ 
    for(int i = 0; i < mat1.length; i++){
      for(int j = 0; j < mat1[i].length; j++){
        mat1[i][j] += mat2[i][j];
      }
    }
    
    return mat1;
  }
  
  int[][] cycleMatrixInc(int[][] mat, int low, int high){
    //32 - 126 for ASCII
    
     for(int i = 0; i < mat.length; i++){
       for(int j = 0; j < mat[i].length; j++){
         if(mat[i][j] < low){
           mat[i][j] = high + 1 - (low - mat[i][j]);
         } else if(mat[i][j] > high){
           mat[i][j] = low - 1 + (mat[i][j] - high);
         }
       }
     }
     return mat;
  }
  
 
