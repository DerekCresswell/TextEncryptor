
  /*
  *  Text Encrypter / Decrytper
  *  All code written by : Derek Cresswell
  */

  import controlP5.*;
  
  ControlP5 cp5;
  
  String text = "";
  String pass = "";
  boolean funcChoice = true;
  
  void setup(){
    size(500, 300);
      
    //String text = "The camp fire party is starting at 6!";
    //String pass = "fire275";
    //String res = encrypt(text, pass);
    //System.out.println(res);
    //System.out.println(decrypt(res, pass)); 
      
    cp5 = new ControlP5(this);
    cp5.addTextfield("text").setPosition(20, 40).setSize(200, 20);
    cp5.addTextfield("pass").setPosition(20, 80).setSize(200, 20);
    cp5.addTextfield("result").setPosition(20, 140).setSize(200, 20);
    cp5.addBang("funcChoice").setPosition(240, 40);
    cp5.addBang("send").setPosition(240, 80);
      
  }
  
  void draw(){
    background(0);
  }
  
  void send(){
    if(funcChoice){
      String str = (encrypt(cp5.get(Textfield.class, "text").getText(), cp5.get(Textfield.class, "pass").getText()));
      cp5.get(Textfield.class, "result").setText(str);
    } else {
      String str = (decrypt(cp5.get(Textfield.class, "text").getText(), cp5.get(Textfield.class, "pass").getText()));
      cp5.get(Textfield.class, "result").setText(str);
    }
  }
