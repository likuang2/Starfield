Star [] atoms;
int Clicks = 1;
void setup(){
  background(0);
  noStroke();
  size(1000, 1000);
  atoms = new Star[100];
  for(int i = 0; i < atoms.length; i++){
    atoms[i] = new Star();
  }
  for(int i = 0; i < 20 ; i++){
    atoms[i] = new Sun();
  }
}

void draw(){
  if(Clicks % 2 != 0){
  background(0);
  fill(253, 184, 19);//sun yellow
  ellipse(250,250,125,125);//the sun
  fill(0, 0, 255);
  ellipse(935,935,500,500);//earth?!
 }
 else if(Clicks % 2 == 0){
  background(0);
  fill(0, 0, 255);//lol
  ellipse(935,935,500,500);//earth?!
  for(int i = 0; i < atoms.length; i++){//explosion
     atoms[i].show();
     atoms[i].move();
   }
 }
}

class Star{
  double myX, myY, mySpeed, myAngle;
  int myColor, myHeight, myWidth;
  Star(){
    myX = 500.0;
    myY = 500.0;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*15+1;
    myColor = color(255, 255, (int)(Math.random()*256));
    myHeight = 15;
    myWidth = 15;
  }
  
  void move(){
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;

  }
  
  void show(){
    fill(myColor);
    ellipse((int)myX, (int)myY, myWidth, myHeight);
  }
}
void mousePressed(){
  for(int i = 0; i < atoms.length; i++){
    atoms[i].myX = 250;
    atoms[i].myY = 250;
    atoms[i].myAngle = Math.random()*3*Math.PI;
    atoms[i].mySpeed = Math.random()*15+1;
  }
  Clicks = Clicks + 1;
}

class Sun extends Star{
  Sun(){
    myX = 500;
    myY = 500;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*5+1;
    myColor = color(206, 32, 41);//fireball red
    myHeight = 15;
    myWidth = 15;
  }
  void move(){
    myX = myX + (int)(Math.random()*5)-2;
    myY = myY + (int)(Math.random()*5)-2;
  }
}
