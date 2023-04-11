class Game {
  Boolean gameOccuring = false;
  Integer score = 0;
  Integer difficulty = 0;
  PImage backgrnd;
  SoundFile song;
  BeatDetector detector;

  StartScreen startScreen;
  GameScreen gameScreen;
  EndScreen endScreen;
  Screen activeScreen;
  
  public Game() {
    backgrnd = loadImage("assets/images/spacefractal1000x726.jpg");
    startScreen = new StartScreen(this, backgrnd);
    gameScreen = new GameScreen(this, backgrnd);
    endScreen = new EndScreen(this, backgrnd);
    activeScreen = startScreen;
  }
  
  public void display() {
    activeScreen.display();
  }
  
  public void handleClick(float x, float y) {
    activeScreen.handleClick(x, y);
  }
  
  public boolean inGame(){return gameOccuring;}
  
  void startGame(Integer difficulty) {
    gameOccuring = true;
    println("Starting game! " + difficulty);
    this.difficulty = difficulty;
    activeScreen = gameScreen;
  }

  void resetGame() {}  
  void endGame() {
    gameOccuring = false;
  }
  
  void testButton() {
    println("Click!");  
  }
}
