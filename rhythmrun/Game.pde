import java.io.*;
import java.util.Scanner;
import java.time.LocalDateTime;
import java.time.format.FormatStyle;
import java.time.format.DateTimeFormatter;

class Game {
  Integer score = 0;
  Integer difficulty = 2;
  PImage backgrnd;
  SoundFile song;
  BeatDetector detector;
  ArrayList<LeaderboardScore> highScores;

  StartScreen startScreen;
  GameScreen gameScreen;
  EndScreen endScreen;
  Screen activeScreen;
  
  public Game() {
    backgrnd = loadImage("assets/images/spacefractal1000x726.jpg");
    startScreen = new StartScreen(this, backgrnd);
    gameScreen = new GameScreen(this, backgrnd);
    endScreen = new EndScreen(this, backgrnd);
    activeScreen = startScreen;
    highScores = new ArrayList<>();
  }
  
  public void display() {
    activeScreen.display();
  }
  
  public void handleClick(float x, float y) {
    activeScreen.handleClick(x, y);
  }
  
  
  void startGame(Integer difficulty) {
    println("Starting game! " + difficulty);
    this.difficulty = difficulty;
    activeScreen = gameScreen;
    audio.stopMenuSong();
    
  }  

  void resetGame() {
    score = 0;
    difficulty = 2;
  }
  
  void endGame() {
    highScores = updateHighScores(loadHighScores(), score);
    println(highScores);
    writeHighScores(highScores);
    activeScreen = endScreen;
    audio.stopGameSong();
  }
  
  void returnToStart() {
    activeScreen = startScreen;
    resetGame();
  }

  ArrayList<LeaderboardScore> loadHighScores() {
    ArrayList<LeaderboardScore> scores = new ArrayList<>();

    try {
      BufferedReader reader = createReader("highScores.txt");
      String line = "";

      while ((line = reader.readLine()) != null) {
        println("## Running");
        Integer rank = 0;
        Integer currScore = 0;
        String dateTime = "";

        rank = Integer.parseInt(line);

        if ((line = reader.readLine()) != null)
          currScore = Integer.parseInt(line);
        else break;

        if ((line = reader.readLine()) != null)
          dateTime = line;
        else break;

        scores.add(new LeaderboardScore(rank, currScore, dateTime));
      }

  
    } catch (Exception e) {
      e.printStackTrace();
    }

    return scores;
  }

  String formattedCurrentTime() {
    LocalDateTime currTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM, FormatStyle.SHORT);
    return currTime.format(formatter);
  }

  ArrayList<LeaderboardScore> updateHighScores(ArrayList<LeaderboardScore> scores, Integer score) {
    boolean newHighScore = false;
    ArrayList<LeaderboardScore> newScores = scores;

    for (int i = 0; i < newScores.size(); i++) {
      if (newHighScore) {
        newScores.get(i).rank++;
        continue;
      }
      
      if (score <= newScores.get(i).score)
        continue;

      newHighScore = true;
      newScores.add(i, new LeaderboardScore(
        i + 1,
        score,
        formattedCurrentTime()
      ));
    }

    while (newScores.size() > 5)
      newScores.remove(newScores.size() - 1);
    return newScores;
  }

  void writeHighScores(ArrayList<LeaderboardScore> scores) {
    try {
      PrintWriter writer = createWriter("data/highScores.txt");

      for (int i = 0; i < Math.min(5, scores.size()); i++) {
        writer.println(scores.get(i).rank);
        writer.println(scores.get(i).score);
        writer.println(scores.get(i).dateTime);
      }

      writer.flush();
      writer.close();

    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
