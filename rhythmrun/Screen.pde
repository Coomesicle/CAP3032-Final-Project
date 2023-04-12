class Screen {
  Game game;
  ArrayList<Button> buttons;
  PImage backgrnd;

  public Screen(Game game, PImage backgrnd) {
    this.backgrnd = backgrnd;
    this.game = game;
    buttons = new ArrayList<>();
  }

  public void handleClick(float x, float y) {
    for (Button button : buttons)
      if (button.isOver(x, y))
        button.onClick.run();
  }

  public void display() {
    background(backgrnd);
  }
  
}

class StartScreen extends Screen {

  public StartScreen(Game game, PImage backgrnd) {
    super(game, backgrnd);

    buttons.add(new Button(
      (float) (5 * width / 6),
      (float) (3 * height / 8),
      120.0f,
      50.0f,
      true,
      () -> {game.startGame(2);},
      null
    ));

    buttons.get(buttons.size() - 1).display = () -> {
      drawEasyButton(buttons.get(0));
    };

    buttons.add(new Button(
      (float) (5 * width / 6),
      (float) (height / 2),
      180.0f,
      50.0f,
      true,
      () -> {game.startGame(3);},
      null
    ));

    buttons.get(buttons.size() - 1).display = () -> {
      drawMediumButton(buttons.get(1));
    };

    buttons.add(new Button(
      (float) (5 * width / 6),
      (float) (5 * height / 8),
      120.0f,
      50.0f,
      true,
      () -> {game.startGame(4);},
      null
    ));

    buttons.get(buttons.size() - 1).display = () -> {
      drawHardButton(buttons.get(2));
    };

    // buttons.add(new Button(
    //   2 * width / 4,
    //   3 * height / 4,
    //   2 * width / 4 + 180,
    //   3 * height / 4 + 50,
    //   true,
    //   () -> {game.startGame(2);},
    //   () -> {rect(0, 0, width / 2, height / 2)};
    // ));

    // buttons.add(new Button(
    //   3 * width / 4,
    //   3 * height / 4,
    //   3 * width / 4 + 120,
    //   3 * height / 4 + 50,
    //   true,
    //   () -> {game.startGame(2);},
    //   () -> {rect(0, 0, width / 2, height / 2)};
    // ));    
  }

  @Override
  public void display() {
    background(backgrnd);
    PFont gaj;
    gaj = createFont("GajrajOne-Regular.ttf", 128);
    textFont(gaj);
    
    textAlign(LEFT);
    textfunc( 40, height / 2, 128, #FF0303 , "RhYthm");
    textfunc( 40, height / 2 + 110, 128, #FF0303 , "Run");
    
    // textAlign(CENTER);
    // textfunc( width/4, 3*height/4, 30, #05FF03 , "EASY");
    // textfunc( 2*width/4, 3*height/4, 30, #FFA703 , "MEDIUM");
    // textfunc( 3*width/4, 3*height/4, 30, #FF0303 , "HARD");
    
    //blur
    filter(BLUR, 2); /////////////////////////////
    
    fill(0, 0, 0, 150);
    rectMode(CORNER);
    rect(2 * width / 3, 0, width / 3, height);
    
    textAlign(LEFT);
    textfunc( 40, height / 2, 128, 255 , "RhYthm");
    textfunc( 40, height / 2 + 110, 128, 255 , "Run");
    textAlign(CENTER);
    
    // filter(BLUR, 2); /////////////////////////////
    
    // textfunc( width/4, 3*height/4, 30, 255 , "EASY");
    // textfunc( 2*width/4, 3*height/4, 30, 255 , "MEDIUM");
    // textfunc( 3*width/4, 3*height/4, 30, 255 , "HARD");

    for (Button button : buttons)
      button.display.run();    
  }

  void drawEasyButton(Button btn) {
    rectMode(btn.centered ? CENTER : CORNER);
    
    if (btn.isOver(mouseX, mouseY))
      fill(50, 200, 0, 110);
    else
      fill(0, 150, 0, 110);
    
    noStroke();
    rect(btn.x, btn.y, btn.width, btn.height, 40);
    textAlign(CENTER, CENTER);
    textfunc(btn.x, btn.y - 5, 30, #02FF02, "EASY");
  }

  void drawMediumButton(Button btn) {
    rectMode(btn.centered ? CENTER : CORNER);
    
    if (btn.isOver(mouseX, mouseY))
      fill(200, 200, 50, 110);
    else
      fill(150, 150, 0, 110);
    
    noStroke();
    rect(btn.x, btn.y, btn.width, btn.height, 40);
    textAlign(CENTER, CENTER);
    textfunc(btn.x, btn.y - 5, 30, #FFB703 , "MEDIUM");
  }

  void drawHardButton(Button btn) {
    rectMode(btn.centered ? CENTER : CORNER);
    
    if (btn.isOver(mouseX, mouseY))
      fill(200, 50, 50, 110);
    else
      fill(150, 0, 0, 110);
    
    noStroke();
    rect(btn.x, btn.y, btn.width, btn.height, 40);
    textAlign(CENTER, CENTER);
    textfunc(btn.x, btn.y - 5, 30, #FF0303 , "HARD");
  }
}

class GameScreen extends Screen {
  public GameScreen(Game game, PImage backgrnd) {
    super(game, backgrnd);
  }

  @Override
  public void display() {
    super.display();
  }
}

class EndScreen extends Screen {
  ArrayList<LeaderboardScore> scores;
  
  public EndScreen(Game game, PImage backgrnd) {
    super(game, backgrnd);
    scores = new ArrayList<>();
    createTestScores();
    
    buttons.add(new Button(
      width / 2,
      9 * height / 10,
      300,
      60,
      true,
      () -> {game.returnToStart();},
      () -> {}
    ));
    
    buttons.get(buttons.size() - 1).display = () -> {
      drawReturnButton(buttons.get(0));
    };
  }

  @Override
  public void display() {
    super.display();
    // Score Text
    PFont gaj;
    gaj = createFont("GajrajOne-Regular.ttf", 128);
    textFont(gaj);
    textAlign(CENTER);
    
    textfunc(width / 2, 100, 80, #FFFFFF, "Final Score");
    textfunc(width / 2, 220, 130, #FFFFFF, game.score.toString());
    
    // TODO: Add Leaderboard
    // Position
    // Score
    // Date/Time
    drawLeaderboard();
    
    for (Button button : buttons)
      button.display.run();
  }
  
  void drawLeaderboard() {
    fill(0, 0, 0, 150);
    rectMode(CORNER);
    rect(80, 250, width - 2 * 80, 340, 40);
    
    textAlign(LEFT);
    textfunc(100, 300, 30, #FFFFFF, "Rank");
    textfunc(250, 300, 30, #FFFFFF, "Score");
    textfunc(500, 300, 30, #FFFFFF, "Date/Time");
    rectMode(CORNER);
    fill(#FFFFFF);
    rect(100, 310, width - 200, 2);
    
    for (int i = 0; i < scores.size(); i++) {
      Integer yPos = 350 + i * 50;
      textfunc(100, yPos, 30, #FFFFFF, scores.get(i).rank.toString());
      textfunc(250, yPos, 30, #FFFFFF, scores.get(i).score.toString());
      textfunc(500, yPos, 30, #FFFFFF, scores.get(i).dateTime);
    }
  }
  
  void drawReturnButton(Button btn) {
    rectMode(btn.centered ? CENTER : CORNER);
    
    if (btn.isOver(mouseX, mouseY))
      fill(200, 200, 200, 110);
    else
      fill(150, 150, 150, 110);
    
    noStroke();
    rect(btn.x, btn.y, btn.width, btn.height, 40);
    textAlign(CENTER, CENTER);
    textfunc(btn.x, btn.y - 5, 30, #FFFFFF , "Return to Menu");
  }
  
  void createTestScores() {
    scores.add(new LeaderboardScore(1, 9000, "x"));
    scores.add(new LeaderboardScore(2, 8000, "x"));
    scores.add(new LeaderboardScore(3, 7000, "x"));
    scores.add(new LeaderboardScore(4, 6000, "x"));
    scores.add(new LeaderboardScore(5, 5000, "x"));
  }
}

void textfunc(float x, float y, int txtSize, int fillCol , String str){
  textSize(txtSize);
  fill(fillCol);
  text(str, x, y); 
}
