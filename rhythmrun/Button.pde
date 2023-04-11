// Parent Class for All Buttons
class Button {
  float x;
  float y;
  float width;
  float height;
  boolean centered;
  Runnable onClick;
  Runnable display;

  public Button(float x, float y, float width, float height, boolean centered, Runnable onClick, Runnable display) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.centered = centered;
    this.onClick = onClick;
    this.display = display;
  }

  public boolean isOver(float mx, float my) {
    if (centered)
      return (
        mx >= x - (width / 2) &&
        mx <= x + (width / 2) &&
        my >= y - (height / 2) &&
        my <= y + (height / 2)
      );

    return mx >= x && mx <= x + width && my >= y && my <= y + height;  
  }
}
