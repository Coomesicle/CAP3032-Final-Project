import processing.sound.*;

// this class handles all the audio aspects of the game
class Audio {
  
  private SoundFile gameSong;
  private SoundFile menuSong;
  private SoundFile endClapping;
  private BeatDetector beat;
  Boolean menuSongPlaying = true;
  Boolean gameSongPlaying = false;
  Boolean endSongPlaying = false;
  
  // sets the songs/sounds for the games as well as initiliazes the beat detector
  public Audio(PApplet parent) {
    gameSong = new SoundFile(parent, "assets/music/GameSong.wav");
    menuSong = new SoundFile(parent, "assets/music/MenuSong.wav");
    endClapping = new SoundFile(parent, "assets/music/EndOfGame.wav");
    beat = new BeatDetector(parent);
    beat.input(gameSong);
  }
  
  // plays the specfic song for the screen the user is on
  public void playSong(){
    if(menuSongPlaying && !menuSong.isPlaying()){
      menuSong.play();
      gameSong.stop();
      endClapping.stop();
      menuSongPlaying = false;
      print("Playing Menu Song");
    }
    else if(gameSongPlaying && !gameSong.isPlaying()){
      gameSong.play();
      menuSong.stop();
      endClapping.stop();
      gameSongPlaying = false;
      print("Playing Game Song");
    }
    else if(!menuSong.isPlaying() && !gameSong.isPlaying() && !endClapping.isPlaying() && endSongPlaying){
      endClapping.play();
      game.endGame();
      print("Playing End Song");
    }
  }
  
  // stops playing the menu song
  public void stopMenuSong() {
    menuSongPlaying = false;
    gameSongPlaying = true;
    endSongPlaying = true;
  }
  // stops playing the game song
  public void stopGameSong(){
    gameSongPlaying = false;
    menuSongPlaying = true;
    endSongPlaying = false;
  }

  // this sets the difficulty/the sensitivity of the beat detector
  public void setDifficulty(int difficulty){
    beat.sensitivity(1500/difficulty);
  }
  // checks if there is a beat
  public boolean isBeat(){
    return beat.isBeat();
  }
}
