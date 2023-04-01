
class Game {
  boolean onGameScreen = false;
  Integer score = 0;
  Integer difficulty = 0;
  PImage backgrnd;
  SoundFile song;
  BeatDetector detector;
  ArrayList<Button> startScreenButtons;
  ArrayList<Button> gameScreenButtons;
  
  public Game() {
    backgrnd = loadImage("assets/images/spacefractal1000x726.jpg");
    startScreenButtons = new ArrayList<>();
    gameScreenButtons = new ArrayList<>();
    
    /*
    This is how you would add a button to the screen.
    this::testButton is an onClick function.
    
    startScreenButtons.add(new Button(
      0, 0, width, height, this::testButton
    ));
    */
  }
  
  public void display() {
    if (onGameScreen)
      drawGameScreen();
    else
      drawStartScreen();
  }
  
  public void handleClick(float x, float y) {
    // Find button with corresponding coordinates and call its onClick function.
    for (Button button : startScreenButtons)
      if (button.isOver(x, y))
        button.onClick.run();
  }
  
  void textfunc(int x, int y, int txtSize, int fillCol , String str){
    textSize(txtSize);
    fill(fillCol);
    text(str, x, y); 
  }
  
  void drawStartScreen() {
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
  
  void drawGameScreen() {}
  void startGame() {}
  void resetGame() {}  
  void endGame() {}
  
  void testButton() {
    println("Click!");  
  }
}
