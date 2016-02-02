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
  Ball ball = new Ball(200, height / 2, color(0, 255, 255));
  gameObjects.add(ball);
  
  cp5 = new ControlP5(this);
  
  //declarations for cp5 buttons
  cp5.addButton("drawTrendGraph").setValue(1).setPosition(150,275).setSize(80,50).setLabel("Start Game");
  cp5.addButton("drawScatter").setValue(2).setPosition(350,275).setSize(80,50).setLabel("Instructions");
  
  minim = new Minim(this);
  player = minim.loadFile("Jet Set Radio Future - Technopathic.mp3", 2048);
  player.loop();
  
  img = loadImage("pong.jpg");
  image(img, 0, 0);
  image(img, 0, 0, width, height);
  
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
  image(img, 0, 0, width, height);
  
  for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  checkCollisions();
}

void checkCollisions()
{
 
} 