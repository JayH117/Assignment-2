//Audio library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//controlp5 library
import controlP5.*;
ControlP5 cp5;

//declaring audio player
Minim minim;
AudioPlayer player;
AudioMetaData meta;

PFont f;//declaring font variable
PImage img;//declaring image variable

void setup()
{
  size(600, 600);
  Ball ball = new Ball(width/2, height / 2, color(0, 255, 255));
  gameObjects.add(ball);
  rectMode(CENTER);
  
  cp5 = new ControlP5(this);
  
  f = createFont("Arial",32,true);
  
  //declarations for cp5 buttons
  cp5.addButton("startgame").setValue(1).setPosition(150,450).setSize(80,50).setLabel("Start Game").show();
  cp5.addButton("instructions").setValue(2).setPosition(350,450).setSize(80,50).setLabel("Instructions").show();
  
  //choosing song
  minim = new Minim(this);
  player = minim.loadFile("Jet Set Radio Future - Technopathic.mp3", 2048);
  
  textFont(f,16);//choosing text font and size
  
  //loading and displaying menu
  img = loadImage("pong.jpg");
  image(img, 0, 0);
  image(img, 0, 0, width, height);
  
  //line variable
  Line line = new Line('W', 'S', 'A', 'D', 10, 70, width/2, 0, color(255, 0, 0));
  gameObjects.add(line);
  start=0;
}

//declaring initial variables
int start;
int printscore;
int score;
int message;
int countdown = 3;

//array list used for collisions
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
  
  if (start == 0)
  {
    image(img, 0, 0, width, height);//menu
  }
  else if(start == 2)//start
  {
    background(0);
    player.mute();
    fill(255, 0, 0);
    textFont(f, 32);
    textAlign(CENTER);
    //Failure messages
    if(message == 1)
    {
      text("Sorry, Games require skill",width/2, 200);
    }
    if(message == 2)
    {
      text("Try Lee Carvalo's Putting Challenge",width/2, 200);
    }
    if(message == 3)
    {
      text("It's like you have no brain",width/2, 200);
    }
    if(message == 4)
    {
      text("Not bad, but still, bad.",width/2, 200);
    }
    if(message == 5)
    {
      text("You're good. No wait, the other one, bad.",width/2, 200);
    }
    if(message == 6)
    {
      text("You beat a game, good job, loser",width/2, 200);
    }
        
    text("Score: " + printscore, width/2, 450);  
  }
  else
  {
    fill(255, 0, 0);
    textFont(f, 32);
    textAlign(CENTER);
    
    if(frameCount % 60 == 0)
    {
      //timers used for levels and scores
      score ++;
      printscore++;
      countdown--;
    }
    
    //level obstacles occuring at different intervals
    if(score < 30)
    {
      background (0);
      if(score < 7)
      {
        text("Even you can do this part", width/2, 300); 
      }
      message = 1;
    }
    
    else if(score > 30 && score < 60)
    {
      background(random(0,255),random(0,255), random(0,255));
      if(score < 35)
      {
        text("Still pretty easy", width/2, 300); 
      }
      message = 2;
    }
    
    else if(score > 60 && score < 90)
    {
       for (int k = 0 ; k < 1 ; k ++)
          {
            if(frameCount % 5 == 0)
            {
              background(0);
            }
            stroke(0, 255, 255);
            fill(0,255,255);
            ellipse(random(0, 600), random(0, 600), 30, 30);
          } 
          if(score < 65)
          {
            stroke(255);
            text("Which one is the real ball?", width/2, 300); 
          }
          message = 3;
    }
    
    else if(score >90 && score < 120)
    {
      if(score == 91)
      {
        background(0);
      }
      if(score < 95)
          {
            text("Don't do drugs kids", width/2, 300); 
          }
      message = 4;
    }
    
    else if(score >120 && score < 150)
    {
      background(0, 255, 255);
      if(score % 2 == 0)
      {
        background(0);
      }
      if(score < 125)
          {
            text("Where did it go?", width/2, 300); 
          }
      message = 5;
    }
    else if(score >= 150)
    {
      message = 6;
      gameover();
    }
    
    //wipe the background between obstacles
    else
    {
      background(0);
    }
    if(score < 3)
    {
      background(0);
      textAlign(CENTER);
      fill(255);
      textFont(f, 32);
      text("Get Ready", width/2, 300);
      text(""+countdown, width/2, 500);
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
  checkCollisions();//calling check collisions
}

void checkCollisions()
{
  //cycle through game objects array list
  //if ball is touching line, rotate it using bounce interface
 for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
 {
    GameObject go = gameObjects.get(i);
    if (go instanceof Ball)
    {
      //game over condition, if ball is off screen
      if(go.pos.x > width || go.pos.x < 0 || go.pos.y > height || go.pos.y < 0)
      {
        gameover();
      }
      for(int j = gameObjects.size() - 1 ; j >= 0   ;j --)
      {
        GameObject other = gameObjects.get(j);
        if (other instanceof Line)
        {
          if (go.pos.dist(other.pos) < go.halfW-10 + other.halfW)
          {
            ((Line) other).applyTo((Ball)go);
          }
         }
        }
      }
    }
 } 

//display instructions
void instructions()
{
  img = loadImage("inst.jpg");
  image(img, 0, 0);
  image(img, 0, 0, width, height);
}
7//loop the audio, hide buttons and commence game
void startgame()
{
  player.loop();
  start = 1;
  cp5.get("startgame").hide();
  cp5.get("instructions").hide();
}

//display score, appropriate game over message
void gameover()
{
  start = 2;
}
  