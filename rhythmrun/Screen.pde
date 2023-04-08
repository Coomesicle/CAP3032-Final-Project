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

    fill(0, 0, 0, 150);
    rectMode(CORNER);
    rect(2 * width / 3, 0, width / 3, height);
    
    // textAlign(CENTER);
    // textfunc( width/4, 3*height/4, 30, #05FF03 , "EASY");
    // textfunc( 2*width/4, 3*height/4, 30, #FFA703 , "MEDIUM");
    // textfunc( 3*width/4, 3*height/4, 30, #FF0303 , "HARD");
    
    //blur
    filter(BLUR, 2); /////////////////////////////
    
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
    fill(0, 150, 0, 110);
    noStroke();
    rect(btn.x, btn.y, btn.width, btn.height, 40);
    textAlign(CENTER, CENTER);
    textfunc(btn.x, btn.y - 5, 30, #02FF02, "EASY");
  }

  void drawMediumButton(Button btn) {
    rectMode(btn.centered ? CENTER : CORNER);
    fill(150, 150, 0, 110);
    noStroke();
    rect(btn.x, btn.y, btn.width, btn.height, 40);
    textAlign(CENTER, CENTER);
    textfunc(btn.x, btn.y - 5, 30, #FFB703 , "MEDIUM");
  }

  void drawHardButton(Button btn) {
    rectMode(btn.centered ? CENTER : CORNER);
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
  public EndScreen(Game game, PImage backgrnd) {
    super(game, backgrnd);
  }

  @Override
  public void display() {
    
  }
}

void textfunc(float x, float y, int txtSize, int fillCol , String str){
  textSize(txtSize);
  fill(fillCol);
  text(str, x, y); 
}