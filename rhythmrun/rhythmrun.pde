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

// grabs the location of where the mouse was clicked
void mousePressed() {
  game.handleClick(mouseX, mouseY);
}

// detects which key was pressed and looks at the color corresponding to that key
void keyPressed(){
    if(key=='w' || key=='W' || keyCode==UP){
      //Red
      game.updateScore(1);
    }
    if(key=='a' || key=='A' || keyCode==LEFT){
      //Yellow
      game.updateScore(4);
    }
    if(key=='s' || key=='S' || keyCode==DOWN){
      //Green
      game.updateScore(3);
    }
    if(key=='d' || key=='D' || keyCode==RIGHT){
      game.updateScore(2);
    }
  }
