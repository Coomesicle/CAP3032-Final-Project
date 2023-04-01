PImage backgrnd;

void setup(){
  size(1000, 726); 
  backgrnd = loadImage("assets/images/spacefractal1000x726.jpg");
}

void draw(){
  background(backgrnd);
  PFont gaj;
  gaj = createFont("GajrajOne-Regular.ttf", 128);
  textFont(gaj);
  
  textAlign(LEFT);
  textfunc( 40, 120, 128, #FF0303 , "RhYthm");
  textfunc( 40, 230, 128, #FF0303 , "Run");
  
  textAlign(CENTER);
  textfunc( width/4, 3*height/4, 30, #05FF03 , "EASY");
  textfunc( 2*width/4, 3*height/4, 30, #FFA703 , "MEDIUM");
  textfunc( 3*width/4, 3*height/4, 30, #FF0303 , "HARD");
  
  //blur
  filter(BLUR, 2); /////////////////////////////
  
  textAlign(LEFT);
  textfunc( 40, 120, 128, 255 , "RhYthm");
  textfunc( 40, 230, 128, 255 , "Run");
    
  
  
  textAlign(CENTER);
  
  //filter(BLUR, 2); /////////////////////////////
  
  textfunc( width/4, 3*height/4, 30, 255 , "EASY");
  textfunc( 2*width/4, 3*height/4, 30, 255 , "MEDIUM");
  textfunc( 3*width/4, 3*height/4, 30, 255 , "HARD");
  
}



void textfunc(int x, int y, int txtSize, int fillCol , String str){
  textSize(txtSize);
  fill(fillCol);
  text(str, x, y); 
}
