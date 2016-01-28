// A demo of abstract classes and interfaces

void setup()
{
  size(600, 600);
  Ball ball = new Ball('W', 'A', 'D', ' ', 200, height / 2, color(0, 255, 255));
  gameObjects.add(ball);
  
  Line line = new Line();
  gameObjects.add(line);
  
}

// The class name always starts with uppercase!!
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

boolean[] keys = new boolean[512];

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

void draw()
{
  background(0);
  
  for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
 
  
}

void checkCollisions()
{
 for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
 {
    GameObject go = gameObjects.get(i);
    if (go instanceof Ball)
    {
      for(int j = gameObjects.size() - 1 ; j >= 0   ;j --)
      {
        GameObject other = gameObjects.get(j);
        if (other instanceof Line) // Check the type of a object
        {
          // Bounding circle collisions
          if (go.pos.dist(other.pos) < go.halfW + other.halfW)
          {
            
          }
        }
      }
    }
 }