// A demo of abstract classes and interfaces

void setup()
{
  size(600, 600);
  Ball ball = new Ball(200, height / 2, color(0, 255, 255));
  gameObjects.add(ball);
  
  Line line = new Line('W', 'S', 'A', 'D', 10, 70, width/2, 0, color(0, 255, 255));
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


 
 