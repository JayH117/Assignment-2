// The class name starts with uppercase
class Ball extends GameObject
{
  // Fields!
  char move;
  char left;
  char right;
  char fire;
  
  int lives;
  int ammo;
  
  // Constructor!!
  // HAS NO RETURN TYPE
  // Name is always the same as the class
  Ball()
  {
    // Constructor chaining. Call a constructor in the super class
    super(width * 0.5f, height  * 0.5f, 50);     
    
  }
  
  Ball(char move, char left, char right, char fire, float startX, float startY, color c)
  {
    super(startX, startY, 50);
    this.move = move;
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.c = c;
    lives = 10;
    ammo = 10;
  }

  int elapsed = 12;
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    pos.add(forward);
    
    elapsed ++;
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    stroke(c);
    fill(c);
    text("Ammo: " + ammo, w, 0);
    text("Lives: " + lives, w, 20);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
    ellipse(0, 0, 30,30);
    popMatrix();
  }   
}