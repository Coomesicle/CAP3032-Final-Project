import processing.sound.*;
import java.util.ArrayList;
Game game;
Audio audio;

void setup() {
  size(1000, 726);
  game = new Game();
  audio = new Audio(this);
}

void draw() {
  game.display();
}

void mousePressed() {
  game.handleClick(mouseX, mouseY);
}
void keyPressed() {
  if(key=='s'){audio.playSong();}
  if(key=='z'){audio.pauseSong();}
  if(key=='x'){audio.restartSong();}
}
