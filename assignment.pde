import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//controlp5 library
import controlP5.*;
ControlP5 cp5;

Minim minim;
AudioPlayer player;
AudioMetaData meta;

PImage img;

void setup()
{
  size(600, 600);
  Ball ball = new Ball(width/2, height / 2, color(0, 255, 255));
  gameObjects.add(ball);
  
  cp5 = new ControlP5(this);
  
  //declarations for cp5 buttons
  cp5.addButton("startgame").setValue(1).setPosition(150,450).setSize(80,50).setLabel("Start Game").show();
  cp5.addButton("instructions").setValue(2).setPosition(350,450).setSize(80,50).setLabel("Instructions").show();
  
  minim = new Minim(this);
  player = minim.loadFile("Jet Set Radio Future - Technopathic.mp3", 2048);
  player.loop();
  
  img = loadImage("pong.jpg");
  image(img, 0, 0);
  image(img, 0, 0, width, height);
  
  Line line = new Line('W', 'S', 'A', 'D', 10, 70, width/2, 0, color(0, 255, 255));
  gameObjects.add(line);
  start=0;
  //System.out.print(start);
}

int start;
int frames;

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
  //System.out.print(start);
  if (start == 0)
  {
    image(img, 0, 0, width, height);
  }
  else
  {
    frames++;
    background(0);
    if (frames > 180)
    {
      for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
      {
        GameObject go = gameObjects.get(i);
        go.update();
        go.render();
      }
    }
  }
  System.out.println(start);
  checkCollisions();
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
          if (go.pos.dist(other.pos) < go.halfW + 50)
          {
            ((Line) other).applyTo((Ball)go);
          }
        }
      }
    }
 } 
}
  
void instructions()
{
  img = loadImage("inst.jpg");
  image(img, 0, 0);
  image(img, 0, 0, width, height);
}

void startgame()
{
  start = 1;
  cp5.get("startgame").hide();
  cp5.get("instructions").hide();
}
  