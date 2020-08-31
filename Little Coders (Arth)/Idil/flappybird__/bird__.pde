class Bird{
  //data members of the class "bird"
  //the Pvector is a two dimentional vector in we initialize two coordinates: x and y. we give it a magnitude and a direction.
  PVector pos;
  PVector vel;
  PVector acc;
  float r = 16;
  //functions of the class "bird"
  //constructor to initialize the "bird" object:
  Bird() {
    pos = new PVector(50, height/2); //initial position of the bird
    vel = new PVector(0, 0); //initial velocity of the  bird
    acc = new PVector(); //initial acceleration of the bird
  }
  
  void applyForce(PVector force)
  {
    acc.add(force); //increment the  acceleration by the p..
  }
  
  void update()
  {
    //for every frame
    //blue functions are the funcs that PVector class' has.
    applyForce(gravity); //the bird object is acted upon
    pos.add(vel); //the position of the bird is incremented
    vel.add(acc); //the velocity of the bird is incremented
    vel.limit(4); //the maximum speed of the bird is given
    acc.mult(0); //stops the bird
    
    if (pos.y > height) //if the bird tends to escape
    {
      pos.y = height; //stop it at the edge
      vel.mult(0); // make the velocity 0
    }
  }
  
  void show() {
    stroke(0, 0, 0); //color of the outline of the bird object
    strokeWeight(2); //thickness of the outline
    fill(224, 218, 34); //color of the interior of the object
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
