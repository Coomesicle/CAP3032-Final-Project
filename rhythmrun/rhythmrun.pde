import processing.sound.*;
import java.util.ArrayList;
Game game;
Audio audio;

void setup() {
  size(1000, 726);
  audio = new Audio(this);
  game = new Game();
}

void draw() {
  game.display();
}

void mousePressed() {
  game.handleClick(mouseX, mouseY);
}
void keyPressed(){
    if(key=='w' || key=='W'){
      //Red
      game.updateScore(1);
    }
    if(key=='a' || key=='A'){
      //Yellow
      game.updateScore(4);
    }
    if(key=='s' || key=='S'){
      //Green
      game.updateScore(3);
    }
    if(key=='d' || key=='D'){
      game.updateScore(2);
    }
  }
