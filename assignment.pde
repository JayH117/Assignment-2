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
  
  img = loadImage("pong.jpg");
  image(img, 0, 0);
  image(img, 0, 0, width, height);
  
  Line line = new Line('W', 'S', 'A', 'D', 10, 70, width/2, 0, color(255, 0, 0));
  gameObjects.add(line);
  start=0;
}

int start;
int score;
int interval = 10;
int obj = 0;
int level = 1;

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
  else if(start == 2)
  {
    background(0);
    player.mute();
    println("Try Lee Carvalo's Putting Challenge");
  }
  else
  {
    if(frameCount % 60 == 0)
    {
      score ++;
    }
    
    if(score < 30)
    {
      background (0);
    }
    
    else if(score > 30 && score < 60)
    {
      background(random(0,255),random(0,255), random(0,255));
    }
    
    else if(score > 60 && score < 90)
    {
       for (int k = 0 ; k < 50 ; k ++)
          {
            if(score % 1 == 0)
            {
              background(0);
            }
            stroke(0, 255, 255);
            fill(0,255,255);
            ellipse(random(0, 600), random(0, 600), 30, 30);
          } 
    }
    
    else if(score >90 && score < 120)
    {
      if(score == 91)
      {
        background(0);
      }
      println("Don't do drugs");
    }
    
    else if(score >120 && score < 150)
    {
      background(0, 255, 255);
      if(score % 2 == 0)
      {
        background(0);
      }
    }
    else if(score >= 150)
    {
      level++;
    }
    
    else
    {
      background(0);
    }
   
    if (score > 3)
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
      if(go.pos.x > width || go.pos.x < 0 || go.pos.y > height || go.pos.y < 0)
      {
        gameover();
      }
      for(int j = gameObjects.size() - 1 ; j >= 0   ;j --)
      {
        GameObject other = gameObjects.get(j);
        if (other instanceof Line)
        {
          if (go.pos.dist(other.pos) < go.pos.x)
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
  player.loop();
  start = 1;
  cp5.get("startgame").hide();
  cp5.get("instructions").hide();
}

void gameover()
{
  start = 2;
}
  