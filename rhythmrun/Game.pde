class Game {
  Integer score = 0;
  Integer difficulty = 2;
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
    // activeScreen = startScreen;
    activeScreen = endScreen;
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
  }

  void resetGame() {
    score = 0;
    difficulty = 2;
  }
  
  void endGame() {}
  
  void returnToStart() {
    activeScreen = startScreen;
    resetGame();
  }
}
