
  /*
  *  Text Encrypter / Decrytper
  *  All code written by : Derek Cresswell
  */

  import controlP5.*;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
  
  ControlP5 cp5;
  
  boolean Function = true;
  
  void setup(){
    size(500, 300);
      
    //String text = "The camp fire party is starting at 6!";
    //String pass = "fire275";
    //String res = encrypt(text, pass);
    //System.out.println(res);
    //System.out.println(decrypt(res, pass)); 
      
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
    if(!Function){
      String str = (encrypt(cp5.get(Textfield.class, "Message").getText(), cp5.get(Textfield.class, "Password").getText()));
      cp5.get(Textfield.class, "Result").setText(str);
    } else {
      String str = (decrypt(cp5.get(Textfield.class, "Message").getText(), cp5.get(Textfield.class, "Password").getText()));
      cp5.get(Textfield.class, "Result").setText(str);
    }
  }
  
  void Copy(){
    Toolkit toolkit = Toolkit.getDefaultToolkit();
    Clipboard clipboard = toolkit.getSystemClipboard();
    StringSelection str = new StringSelection(cp5.get(Textfield.class, "Result").getText());
    clipboard.setContents(str, null);
  }
  
  void Paste(){
    
    
    //This is not my code, just example \/\/\/
    //String result = "";
    //Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
    ////odd: the Object param of getContents is not currently used
    //Transferable contents = clipboard.getContents(null);
    //boolean hasTransferableText =
    //  (contents != null) &&
    //  contents.isDataFlavorSupported(DataFlavor.stringFlavor)
    //;
    //if (hasTransferableText) {
    //  try {
    //    result = (String)contents.getTransferData(DataFlavor.stringFlavor);
    //  }
    //  catch (UnsupportedFlavorException | IOException ex){
    //    System.out.println(ex);
    //    ex.printStackTrace();
    //  }
    //}
    //return result;
  }
  
  
  
  
