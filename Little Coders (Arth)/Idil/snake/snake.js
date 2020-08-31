//the snake is divided into small segments, which are drawn and edited on each 'draw' call
let numSegments = 10; //defines the initial length of the snake
let direction = right; //defines the current direction of the snake

const xStart = 0; //starting x coordinate for the snake
const yStart = 250; //starting y coordinate for the snake
const diff = 10; //the rate at which snake moves in a particular direction

let xCor = []; //will store the x coordinate of snake's parts
let yCor = []; //will store the y coordinate of snake's parts

let xFruit = 0; //the x coordinates of the food
let yFruit = 0; //the y coordinates of the food
let scoreElem; //score seection of the interface
let score = 0; //current score of the player

function setup() { //setting up the screen and initializing variables

  scoreElem = createDiv('Score = 0'); //creates an element for showing score within the interface of the game
  scoreElem.position(20,20); //this element will be 20 down from top and 20 oixel right from left-end
  scoreElem.id =  'currScore'; //the id is set
  scoreElem.style('color', 'white'); //the string named "score = 0" will look white
  
  createCanvas(1450,700);
  frameRate(15); //number of times the screen gets refreshed in a sec
  
  stroke(255); //setting the color to white
  strokeWeight(10); //the wideness of the snake
  
  for (let i= 0; i < numSegments; i++) {
    xCor.push(xStart + i * diff); //ith segment of the snake will be i*10 pixels away from the start
    yCor.push(yStart); //left it as is as 0
  }
}

function draw() { //get calls
  background(0); //sets background to black
}
