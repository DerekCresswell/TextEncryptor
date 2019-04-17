  /*
  *  Text Encrypter / Decrytper
  *  All code written by : Derek Cresswell
  */
  
  void setup(){
    String text = "Tomorrow is n0t another day";
    String pass = "Knox85";
    String res = encrypt(text, pass);
    System.out.println(res);
    System.out.println(decrypt(res, pass));
    
    //for(int i = 0; i < 256; i++){
    //  System.out.println(i + " : " + (char) i);
    //}
  }
  
  
  //Temp func
  void printMat(int[][] mat){
    for(int i = 0; i < mat.length; i++){
      for(int j = 0; j < mat[i].length; j++){
        System.out.print(mat[i][j] + ", ");
      }
      System.out.println();
    }
  }
  
  
  
  String encrypt(String text, String pass){
      //size is set up for Add/Sub
      int[] textArr = stringToIntArr(text);
      int[] passArr = stringToIntArr(pass);
      
      int[] size = findDimensionsAS(textArr.length, passArr.length);
      
      int[][] textMat = arrToMatrix(textArr, size[0], size[1], false);
      int[][] passMat = arrToMatrix(passArr, size[0], size[1], true);
      textMat = subtractMatrices(textMat, passMat);

      textMat = cycleMatrixInc(textMat, 32, 126); 
      textArr = matToIntArr(textMat);
      text = arrToString(textArr);
      
      return text;
  }
  /*
  *Empty string catches;
  */
  
  String decrypt(String text, String pass){
      //Size is set up  for Add/Sub
      int[] textArr = stringToIntArr(text);
      int[] passArr = stringToIntArr(pass);
     
      int size[] = findDimensionsAS(textArr.length, passArr.length);
      
      int[][] textMat = arrToMatrix(textArr, size[0], size[1], false);
      int[][] passMat = arrToMatrix(passArr, size[0], size[1], true);
      textMat = addMatrices(textMat, passMat);
      
      textMat = cycleMatrixInc(textMat, 32, 126);
      textArr = matToIntArr(textMat);
      if(text.length() > pass.length()){
        if(text.length() % 2 == 0){
          text = arrToString(textArr);
        } else {
          text = arrToString(textArr).substring(0, text.length() - 1);
        }
        //This does not work
      }
      return text;
  }
  /*
  * Chop extra "_"
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
  
  int[][] arrToMatrix(int[] arr, int row, int col, boolean repeatValues){
    //Converts int array to 2D array of row rows and col columns 
    //0's are substituded if the array is too short
    //If the array is too long the extra values are not used
    
    int[][] toRet = new int[row][col];
    int count = 0;
    int repCount = 0;
    
    for(int i = 0; i < row; i++){   
      for(int j = 0; j < col; j++){
        
         if(count < arr.length){
           toRet[i][j] = arr[count];
         } else {
           if(repeatValues){
           toRet[i][j] = arr[repCount];
           repCount++;
           if(repCount == arr.length)
             repCount = 0;
           } else {
             toRet[i][j] = 0;
           }
           
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
  
  int[] findDimensionsAS(int num1, int num2){
    //Returns an array with the values for the matrices size
    //Indices ; mat1[0][1], mat2[0][1]
    
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
  
    int[] findDimensionsMD(int num1, int num2){
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
  
  int[] matToIntArr(int[][] mat){
    int[] toRet = new int[mat.length * mat[0].length];
    int count = 0;
    
    for(int i = 0; i < mat.length; i++){
      for(int j = 0; j < mat[i].length; j++){
        toRet[count] = mat[i][j];
        count++;
      }
    }
    
    return toRet;
  }
  
  String arrToString(int[] arr){
    String toRet = "";
    
    for(int i = 0; i < arr.length; i++){
      toRet = toRet + Character.toString((char) arr[i]);
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
  
 
