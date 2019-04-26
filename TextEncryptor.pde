
  /*
  *  Text Encrypter / Decrytper
  *  All code written by : Derek Cresswell
  */

  import controlP5.*;
  import java.awt.Toolkit;
  import java.awt.datatransfer.*;
  
  ControlP5 cp5;
  
  int Function = 0;
  //1 = encrypt, 2 = decrypt
  
  void setup(){
    size(500, 300);
      
    cp5 = new ControlP5(this);
    cp5.addTextfield("Message").setPosition(20, 40).setSize(200, 20);
    cp5.addTextfield("Password").setPosition(20, 80).setSize(200, 20);
    cp5.addTextfield("Result").setPosition(20, 140).setSize(200, 20);
    cp5.addDropdownList("Function").setPosition(280, 40).addItem("Encrypt", Function).addItem("Decrypt", Function);
    cp5.addBang("Send").setPosition(240, 80).setSize(20, 20);
    cp5.addBang("Copy").setPosition(240, 140).setSize(20, 20);
    cp5.addBang("Paste").setPosition(240, 40).setSize(20, 20);
      
  }
  
  void draw(){
    background(0);
  }
  
  void Send(){
    String str = cp5.get(Textfield.class, "Message").getText();
    String pass = cp5.get(Textfield.class, "Password").getText();
    
    if(!(str == null || str.equals("")) && !(pass == null || pass.equals("")) ){
      if(Function == 0){
        str = (encrypt(str, pass));
        cp5.get(Textfield.class, "Result").setText(str);
      } else if(Function == 1){
        str = (decrypt(str, pass));
        cp5.get(Textfield.class, "Result").setText(str);
      }
    }
  }
  
  void Copy(){
    Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
    StringSelection str = new StringSelection(cp5.get(Textfield.class, "Result").getText());
    clipboard.setContents(str, null);
  }
  
  void Paste(){
    Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
    Transferable contents = clipboard.getContents(null);
    
    if(contents == null)
      return;
      
    try {
      cp5.get(Textfield.class, "Message").setText((String) 
        clipboard.getData(DataFlavor.stringFlavor));
    } catch (Exception exc){
      exc.printStackTrace();
    } 
  }
  
  
  
