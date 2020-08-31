class Pipe{
  //data members of the pipe class
  float x;
  float top;
  float bottom;
  float w = 40; //thickness of the pipe
  float pipe_speed = 3;
//functions of the pipe class
//constructor to initialize the pipe object
  Pipe()
  {
    x = wid + w;
    top = random(100, height/2); //height of the top pipe
    bottom = random(100, height/2); //height of the bottom pipe
    //100 is the minimum height of the pipes while the maximum height is 200
  }
//check if there is any collision between the bird and the pipe
  boolean hits(Bird b)
  {
    if ((b.pos.x > x) && (b.pos.x < (x+ w))) //if the bird's position in the x-axis is greater than the x-axis of the pipe. 
    //and if the bird is going off the frame/touching the x-axis of the pipe 
    {
      if ((b.pos.y < (top + b.r)) || (b.pos.y > (height - bottom - b.r)))
      //if the bird is in between the pipes.
      {
        return true; //there is a collision
      }
    }
    return false; //there is no collision
  }
  //progress the pipes
  void update()
  {
    x -= pipe_speed;
  }
  
  //show the pipes:
  void show(boolean hit)
  {
    stroke(0, 0, 0); //color of the outline of the pipes
    strokeWeight(2); //thickness of the outline
    if (hit) //if the pipe hits the bird
    {
      fill(217, 74, 30, 127); //change the color to reddish
    }
    else //if the pipe doesnt hit the bird
    {
      fill(65, 224, 129, 127); //change the color to greenish
    }
    //creating the pipes:
    rect(x, 0, w, top); //upper rectangular pipe
    rect(x, height - bottom, w, bottom); //lower rectangular pipe
  }
}
