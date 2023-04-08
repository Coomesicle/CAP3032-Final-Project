import processing.sound.*;
class Audio {
  
  private SoundFile song;
  private BeatDetector beat;
  private Amplitude amp;
  
  public Audio(PApplet parent) {
    song = new SoundFile(parent, "assets/music/Exodus.wav");
    beat = new BeatDetector(parent);
    amp = new Amplitude(parent);
    amp.input(song);
  }
  
  public void playSong(){
    if(!song.isPlaying()){
      song.play();
    }
  }
  public void pauseSong(){
    song.pause();
  }
  public void restartSong(){
    song.jump(0);
    song.stop();
  }
  public void muteSong(){
    if(amp.analyze()==0){
      song.amp(1);
    }
    else{
      song.amp(0);
    }
  }
  
  
  public float isBeat(){
    beat.isBeat(song);
    float amplitude = amp.analyze();
    return amplitude;
  }
  
}
