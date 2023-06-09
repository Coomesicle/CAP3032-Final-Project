// handles the aspects of each specific screen
class Screen {
  Game game;
  ArrayList<Button> buttons;
  PImage backgrnd;
  // constructor
  public Screen(Game game, PImage backgrnd) {
    this.backgrnd = backgrnd;
    this.game = game;
    buttons = new ArrayList<>();
  }
  // checks the mouse click to see if it is over a button
  public void handleClick(float x, float y) {
    for (Button button : buttons)
      if (button.isOver(x, y))
        button.onClick.run();
  }
  // displays the background
  public void display() {
    background(backgrnd);
  }
  
}

// start screen
class StartScreen extends Screen {
  // constructor which adds all the buttons of the start screen
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
  }
 
  // displays the start screen with the buttons and text
  @Override
  public void display() {
    background(backgrnd);
    PFont gaj;
    gaj = createFont("GajrajOne-Regular.ttf", 128);
    textFont(gaj);
    
    textAlign(LEFT);
    textfunc( 40, height / 2, 128, #FF0303 , "RhYthm");
    textfunc( 40, height / 2 + 110, 128, #FF0303 , "Run");
    
    filter(BLUR, 2);
    
    fill(0, 0, 0, 150);
    rectMode(CORNER);
    rect(2 * width / 3, 0, width / 3, height);
    
    textAlign(LEFT);
    textfunc( 40, height / 2, 128, 255 , "RhYthm");
    textfunc( 40, height / 2 + 110, 128, 255 , "Run");
    textAlign(CENTER);
    
    for (Button button : buttons)
      button.display.run();    
  }

  // draws the easy button
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
  
  // draws the medium difficulty button
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

  // draws the hard difficulty button
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

// game screen
class GameScreen extends Screen {
  
  int sx = 2 * game.getDifficulty();
  int sy = 2 * game.getDifficulty();
  int redX1 = 480;
  int redX2 = 520;
  int redY = 330;
  int greenX1 = 480;
  int greenX2 = 520;
  int greenY = 370;
  int blueX = 520;
  int blueY1 = 330;
  int blueY2 = 370;
  int yellowX = 480;
  int yellowY1 = 330;
  int yellowY2 = 370;
  boolean red,blue,yellow,green;
  
  //constructor
  public GameScreen(Game game, PImage backgrnd) {
    super(game, backgrnd);
  }
  
  // displays the square, current score and the lines of the game screen
  @Override
  public void display() {
    super.display();
    displayScore();
    game.beatDisplay();
    stroke(255);
    strokeWeight(3);
    line(200,50, 800,50);
    line(200,50, 200,650);
    line(800,50, 800,650);
    line(200,650, 800,650);
    drawColorLine(200,55, 200,645, color(255,255,0));
    drawColorLine(800,55, 800,645, color(0,0,255));
    drawColorLine(200,50, 800,50, color(255,0,0));
    drawColorLine(200,650, 800,650, color(0,255,0));
    if(yellow){displayYellow();}
    if(green){displayGreen();}
    if(red){displayRed();}
    if(blue){displayBlue();}
  }
  
  // draws the color lines of the square
  void drawColorLine(int x1, int y1, int x2, int y2, color c) {
    stroke(c, 100);
    strokeWeight(10);
    line(x1,y1,x2,y2);
  }
  
  // displays the current score in the top right
  void displayScore(){
    fill(0);
    textSize(40);
    int Score = game.getScore();
    text(("Score: "+ Score),850,20);
  }

  // adds a random colored line to the screen which will start moving after
  public void addObject(){
    int randColor = (int) random(0,5);
    //Might need to check if object is already true
    if(randColor==1){
      red=true;
    }
    if(randColor==2){
      blue=true;
    }
    if(randColor==3){
      green=true;
    }
    if(randColor==4){
      yellow=true;
    }
  }
  
  // displays the moving yellow line
  void displayYellow(){
    drawColorLine(yellowX,yellowY1, yellowX,yellowY2, color(255,255,0));
    yellowX -= sx;
    yellowY1 -= sy;
    yellowY2 += sy;
    if(yellowX < 200) {
      yellowX = 480;
      yellowY1 = 330;
      yellowY2 = 370;
      yellow = false;
    }
  }
  // displays the moving green line
  void displayGreen(){
    drawColorLine(greenX1,greenY, greenX2, greenY, color(0,255,0));
    greenX1 -= sx;
    greenX2 += sx;
    greenY += sy;
    if(greenY > 650) {
      greenX1 = 480;
      greenX2 = 520;
      greenY = 370;
      green = false;
    }
  }
  // displays the moving blue line
  void displayBlue(){
    drawColorLine(blueX,blueY1, blueX,blueY2, color(0,0,255));
    blueX += sx;
    blueY1 -= sy;
    blueY2 += sy;
    if(blueX > 800) {
      blueX = 520;
      blueY1 = 330;
      blueY2 = 370;
      blue = false;
    }
  }
  // displays the moving red line
  void displayRed(){
    drawColorLine(redX1,redY, redX2,redY, color(255,0,0));
    redX1 -= sx;
    redX2 += sx;
    redY -= sy;
    if(redY < 50) {
      redX1 = 480;
      redX2 = 520;
      redY = 330;
      red = false;
    }
  }
  // checks at what point was yellow clicked and calculates the points given based on the location
  public int yellowClicked(){
    int points = 0;
    if(yellowX - 200 < 75) {
      if(yellowX - 200 == 0) {
        points = 150;
      }
      else {
        points = (int)((1/ (float)(yellowX-200)) * 125);
      }
    }
    yellow = false;
    yellowX = 480;
    yellowY1 = 330;
    yellowY2 = 370;
    return points;
  }
  // checks at what point was green clicked and calculates the points given based on the location
  public int greenClicked(){
    int points = 0;
    if(650 - greenY < 75) {
      if(650 - greenY == 0) {
        points = 150;
      }
      else {
        points = (int) ((1/ (float)(650 - greenY)) * 125);
      }
    }
    green = false;
    greenX1 = 480;
    greenX2 = 520;
    greenY = 370;
    return points;
  }
  // checks at what point was blue clicked and calculates the points given based on the location
  public int blueClicked(){
    int points = 0;
    if(800 - blueX < 75) {
      if(800 - blueX == 0) {
        points = 150;
      }
      else {
        points = (int) ((1/ (float)(800-blueX)) * 125);
      }
    }
    blue = false;
    blueX = 520;
    blueY1 = 330;
    blueY2 = 370;
    return points;
  }
  // checks at what point was reds clicked and calculates the points given based on the location
  public int redClicked(){
    int points = 0;
    if(redY - 50 < 75) {
      if(redY == 50) {
        points = 150;
      }
      else {
        points = (int)((1/ (float)(redY-50)) * 125);
      }
    }
    red = false;
    redX1 = 480;
    redX2 = 520;
    redY = 330;
    return points;
  }
}

// end screen
class EndScreen extends Screen {
  // ArrayList<LeaderboardScore> scores;
  
  // constructor which adds buttons
  public EndScreen(Game game, PImage backgrnd) {
    super(game, backgrnd);
    // scores = new ArrayList<>();
    // createTestScores();
    
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

  // displays all the contents of the end screen
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
  
  // draws the leaderboard on the end screen
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
    
    for (int i = 0; i < game.highScores.size(); i++) {
      Integer yPos = 350 + i * 50;
      textfunc(100, yPos, 30, #FFFFFF, game.highScores.get(i).rank.toString());
      textfunc(250, yPos, 30, #FFFFFF, game.highScores.get(i).score.toString());
      textfunc(500, yPos, 30, #FFFFFF, game.highScores.get(i).dateTime);
    }
  }
  
  // draws the return button on the end screen
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
  
  // void createTestScores() {
  //   scores.add(new LeaderboardScore(1, 9000, "x"));
  //   scores.add(new LeaderboardScore(2, 8000, "x"));
  //   scores.add(new LeaderboardScore(3, 7000, "x"));
  //   scores.add(new LeaderboardScore(4, 6000, "x"));
  //   scores.add(new LeaderboardScore(5, 5000, "x"));
  // }
}

// displays text at a specific x and y and with the color passed in
void textfunc(float x, float y, int txtSize, int fillCol , String str){
  textSize(txtSize);
  fill(fillCol);
  text(str, x, y); 
}
