Bird b; //created an obj b of the class bird
int wid = 400;
int rez = 20;
int score = 0; //initializes the score  to 0.
boolean  jumping = false;
PVector gravity = new PVector (0, 0.5); //0 on the x axis but has a little bounce on the y.
ArrayList<Pipe> pipes = new ArrayList<Pipe>(); //declare an array obj of the type pipes
PImage mountain; //declare an image obj for the background
PImage bird;

//this func runs only once:
void setup(){
  size(800, 800);
  b = new Bird(); //initializing the bird obj
  pipes.add(new Pipe()); //add a Pipe obj to the list of pipes
  mountain = loadImage("bg.png"); 
}

//this func runs multiplee times:
void draw() {
  background(0, 0, 0); //setting the default background to black
  image(mountain, 0, 0); //background image is put
  
  if (frameCount % 75 == 0)
  {
    pipes.add(new Pipe());
  }
  
  if (keyPressed) //check for a keyboard input
  {
    PVector up = new PVector(0, -5); //the variable for displacement of the obj, gives a bounce to the obj
    b.applyForce(up); //displace the obj up by 5 pixels
  }
  
  b.update();
  b.show();
  boolean safe = true; //a flag variable to indicate if the obj collided with a pipe or not
  
  for (int i = pipes.size() - 1; i >= 0; i--)
  {
    Pipe p = pipes.get(i);
    p.update();
    if (p.hits(b)) //if the bird collides with a pipe
    {
      p.show(true); //shows the red func
      safe = false; //shows the green func
    }
    else //otherwise the bird passes safely
    {
      p.show(false);
    }
    
    if (p.x < -p.w) //if the x posiiton of the pipe is less than the weight of the frame? 
    {
      pipes.remove(i);
    }
  }
  
  if(safe) //if there is no collision
  {
    score++; //increment score by -1
  }
  else //in case of a collision
  {
    score -= 50; //decrement score by a penalty of 50
  }
  
  fill(16, 53, 201); //text color
  textSize(64); 
  text(score, width/2, 50); //displays the score
  score = constrain(score, 0, score);
}
