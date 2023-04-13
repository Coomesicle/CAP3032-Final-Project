import java.io.*;
import java.util.Scanner;
import java.time.LocalDateTime;

class Game {
  Integer score = 1000;
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
    // TODO: DELETE THIS LATER
    endGame();
    // activeScreen = endScreen;
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
  }
  
  void returnToStart() {
    activeScreen = startScreen;
    resetGame();
  }

  ArrayList<LeaderboardScore> loadHighScores() {
    ArrayList<LeaderboardScore> scores = new ArrayList<>();

    try {
      File file = new File("highScores.txt");
      Scanner scanner = new Scanner(file);

      if (!scanner.hasNextLine())
        println("This whole thing won't read!");

      while (scanner.hasNextLine()) {
        println("## Running");
        Integer rank = 0;
        Integer currScore = 0;
        String dateTime = "";

        rank = Integer.parseInt(scanner.nextLine());

        if (scanner.hasNextLine())
          currScore = Integer.parseInt(scanner.nextLine());
        else break;

        if (scanner.hasNextLine())
          dateTime = scanner.nextLine();
        else break;

        scores.add(new LeaderboardScore(rank, currScore, dateTime));
      }

      // scanner.close();
  
    } catch (Exception e) {
      e.printStackTrace();
    }

    return scores;
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
        LocalDateTime.now().toString()
      ));
    }

    return newScores;
  }

  void writeHighScores(ArrayList<LeaderboardScore> scores) {
    try {
      PrintWriter writer = new PrintWriter(new FileWriter("highScores.txt"));
      for (int i = 0; i < Math.min(5, scores.size()); i++) {
        writer.print(scores.get(i).rank);
        writer.print(scores.get(i).score);
        writer.print(scores.get(i).dateTime);
      }
      // writer.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
