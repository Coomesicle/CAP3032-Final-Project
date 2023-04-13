import processing.sound.*;
class Audio {
  
  private SoundFile gameSong;
  private SoundFile menuSong;
  private BeatDetector beat;
  Boolean menuSongPlaying = true;
  Boolean gameSongPlaying = false;
  
  public Audio(PApplet parent) {
    gameSong = new SoundFile(parent, "assets/music/GameSong.wav");
    menuSong = new SoundFile(parent, "assets/music/MenuSong.wav");
    beat = new BeatDetector(parent);
    beat.input(gameSong);
  }
  
  public void playSong(){
    if(menuSongPlaying && !menuSong.isPlaying()){
      menuSong.play();
      gameSong.stop();
    }
    else if(gameSongPlaying && !gameSong.isPlaying()){
      gameSong.play();
      menuSong.stop();
    }
  }
  
  public void stopMenuSong() {
    menuSongPlaying = false;
    gameSongPlaying = true;
  }
  
  public void stopGameSong(){
    gameSongPlaying = false;
    menuSongPlaying = true;
  }

  
  public boolean isBeat(){
    return beat.isBeat();
  }
}
