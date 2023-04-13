class Game {
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
  
  
  void startGame(Integer difficulty) {
    println("Starting game! " + difficulty);
    this.difficulty = difficulty;
    activeScreen = gameScreen;
    audio.stopMenuSong();
    
  }  

  void resetGame() {}  
  void endGame() {
    audio.stopGameSong();
  }
  
  void testButton() {
    println("Click!");  
  }
}
