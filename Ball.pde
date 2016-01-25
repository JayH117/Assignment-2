class Ball extends GameObject
{
  int lives;
  char move;


  Ball()
  {
    super(width * 0.5f, height * 0.5f, 25);
    println("ball in");
  }
  
  Ball(int lives, char move, float startX, float startY)
  {
    super(startX, startY, 50);
    this.lives = 3;
    this.move = move;
  }
  
  void render()
   {
      pushMatrix(); // reset the translation and rotation
      translate(pos.x, pos.y);
      rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
      stroke(c);
      line(- halfW, halfW, 0, - halfW);
      line(0, - halfW, halfW, halfW);
      line(halfW, halfW, 0, 0);
      line(- halfW, halfW, 0, 0);
      popMatrix();
   }   
}