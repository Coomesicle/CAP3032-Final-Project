import processing.sound.*;
import java.util.ArrayList;
Game game;

void setup() {
  size(1000, 726);
  game = new Game();
}

void draw() {
  game.display();
}

void mousePressed() {
  game.handleClick(mouseX, mouseY);
}
