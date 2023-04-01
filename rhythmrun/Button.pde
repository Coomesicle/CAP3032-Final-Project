// Parent Class for All Buttons
class Button {
  float x1;
  float y1;
  float x2;
  float y2;
  Runnable onClick;
  
  public Button(float x1, float y1, float x2, float y2, Runnable onClick) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.onClick = onClick;
  }
  
  public boolean isOver(float x, float y) {
    return x >= x1 && x <= x2 && y >= y1 && y <= y2;  
  }
  
  public void display() {}
}
