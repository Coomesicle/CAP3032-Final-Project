import java.io.*;
import java.util.Scanner;
import java.time.LocalDateTime;
import java.time.format.FormatStyle;
import java.time.format.DateTimeFormatter;
// game class that handles the main game aspects
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
  
  // constructor for the game
  public Game() {
    backgrnd = loadImage("assets/images/spacefractal1000x726.jpg");
    startScreen = new StartScreen(this, backgrnd);
    gameScreen = new GameScreen(this, backgrnd);
    endScreen = new EndScreen(this, backgrnd);
    activeScreen = startScreen;
    highScores = new ArrayList<>();
  }
  
  // displays the current active screen and plays the song
  public void display() {
    activeScreen.display();
    audio.playSong();
  }
  
  // handles the click of the mouse
  public void handleClick(float x, float y) {
    activeScreen.handleClick(x, y);
  }
  
  // starts the game and sets the difficulty
  void startGame(Integer difficulty) {
    println("Starting game! " + difficulty);
    this.difficulty = difficulty;
    activeScreen = gameScreen;
    audio.setDifficulty(difficulty);
    audio.stopMenuSong();
  }

  // resets the game
  void resetGame() {
    score = 0;
    difficulty = 2;
  }
  
  // updates the score of the user based on when they cicked
  public void updateScore(int Key){
    int points = 0;
    if(Key == 1){points = gameScreen.redClicked();}
    if(Key == 2){points = gameScreen.blueClicked();}
    if(Key == 3){points = gameScreen.greenClicked();}
    if(Key == 4){points = gameScreen.yellowClicked();}
    score += points;
  }
  // gets the score
  public int getScore(){return score;}
  //gets the difficulty
  public int getDifficulty(){return difficulty;}
  
  // ends the game, updates the high score leaderboard and sets the screen to the end screen
  void endGame() {
    highScores = updateHighScores(loadHighScores(), score);
    println(highScores);
    writeHighScores(highScores);
    activeScreen = endScreen;
  }
  
  // returns to the start screen by setting the active screen to the start screen
  void returnToStart() {
    activeScreen = startScreen;
    audio.stopGameSong();
    resetGame();
  }

  // loads all the high scores saved
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
  // formats the time/date and is used for the leaderboard
  String formattedCurrentTime() {
    LocalDateTime currTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM, FormatStyle.SHORT);
    return currTime.format(formatter);
  }
  
  // if there is a beat, then it creates a line of one of the 4 colors
  void beatDisplay(){
    if(audio.isBeat()){
      gameScreen.addObject();
    }
  }
  
  // this updates the high score leaderboard using the score that the user achieved after the game
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

  // this writes the leaderboard which shows the rank, score, and the date
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
