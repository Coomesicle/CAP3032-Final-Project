import processing.sound.*;
import java.util.ArrayList;
Game game;

void setup() {
  size(600, 600);
  game = new Game();
}

void draw() {
  game.display();
}

void mousePressed() {
  game.handleClick(mouseX, mouseY);
}

class Game {
  boolean onGameScreen = false;
  Integer score = 0;
  Integer difficulty = 0;
  SoundFile song;
  BeatDetector detector;
  ArrayList<Button> startScreenButtons;
  ArrayList<Button> gameScreenButtons;
  
  public Game() {
    startScreenButtons = new ArrayList<>();
    startScreenButtons.add(new Button(
      0, 0, width, height, this::testButton
    ));
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
  
  void drawStartScreen() {}
  void drawGameScreen() {}
  void startGame() {}
  void resetGame() {}  
  void endGame() {}
  
  void testButton() {
    println("Click!");  
  }
}

// Parent Class for All Buttons
class Button {
  float x1;
  float y1;
  float x2;
  float y2;
  Runnable onClick;
  
  public Button(float x1, float y1, float x2, float y2, Runnable onClick) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.onClick = onClick;
  }
  
  public boolean isOver(float x, float y) {
    return x >= x1 && x <= x2 && y >= y1 && y <= y2;  
  }
  
  public void display() {}
}
