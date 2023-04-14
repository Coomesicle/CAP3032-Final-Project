import processing.sound.*;
import java.util.ArrayList;
Game game;
Audio audio;

void setup() {
  size(1000, 726);
  audio = new Audio(this);
  game = new Game(this);
}

void draw() {
  game.display();
}

void mousePressed() {
  game.handleClick(mouseX, mouseY);
}
