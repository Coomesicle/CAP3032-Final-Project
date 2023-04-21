import processing.sound.*;
class Audio {
  
  private SoundFile gameSong;
  private SoundFile menuSong;
  private SoundFile endClapping;
  private BeatDetector beat;
  Boolean menuSongPlaying = true;
  Boolean gameSongPlaying = false;
  Boolean endSongPlaying = false;
  
  public Audio(PApplet parent) {
    gameSong = new SoundFile(parent, "assets/music/GameSong.wav");
    menuSong = new SoundFile(parent, "assets/music/MenuSong.wav");
    endClapping = new SoundFile(parent, "assets/music/EndOfGame.wav");
    beat = new BeatDetector(parent);
    beat.input(gameSong);
  }
  
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
  
  public void stopMenuSong() {
    menuSongPlaying = false;
    gameSongPlaying = true;
    endSongPlaying = true;
  }
  public void stopGameSong(){
    gameSongPlaying = false;
    menuSongPlaying = true;
    endSongPlaying = false;
  }

  public void setDifficulty(int difficulty){
    beat.sensitivity(1500/difficulty);
  }
  public boolean isBeat(){
    return beat.isBeat();
  }
}
