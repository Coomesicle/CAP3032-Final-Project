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
  audio.playSong();
}

void mousePressed() {
  game.handleClick(mouseX, mouseY);
}

/* Code to test Audio Methods
void keyPressed() {
  if(key=='S' || key=='s'){audio.playGameSong();}
  if(key=='R' || key=='r'){audio.restartGameSong();}
  if(key=='P' || key=='p'){audio.pauseGameSong();}
}
*/
