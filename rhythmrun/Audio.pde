import processing.sound.*;
class Audio {
  private SoundFile file;
  public Audio(PApplet parent) {
  file = new SoundFile(parent, "assets/music/Exodus.wav");}
  public void playSong(){file.play();}
  public void pauseSong(){file.pause();}
  public void restartSong(){
    file.stop();
    file.jump(0);
  }
}
