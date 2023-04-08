import processing.sound.*;
class Audio {
  
  private SoundFile gameSong;
  private SoundFile menuSong;
  private BeatDetector beat;
  
  public Audio(PApplet parent) {
    gameSong = new SoundFile(parent, "assets/music/GameSong.wav");
    menuSong = new SoundFile(parent, "assets/music/MenuSong.wav");
    menuSong.play();
    beat = new BeatDetector(parent);
    beat.input(gameSong);
  }
  
  public void playGameSong(){
    if(!gameSong.isPlaying()){
      gameSong.play();
    }
  }
  public void restartMenuSong(){
    if(!menuSong.isPlaying()){
      menuSong.play();
    }
  }
  
  public void pauseGameSong(){
    gameSong.pause();
  }
  
  public void restartGameSong(){
    gameSong.jump(0);
    gameSong.stop();
  }
  
  public boolean isBeat(){
    return beat.isBeat();
  }
}
