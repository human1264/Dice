dice test;
void setup(){
size(600,600);
noLoop();

}



void draw(){
background(0,0,0);
int sum = 0;
for(int y = 0; y <= 400; y += 35)
{
  {
    for(int x = 0; x <= 600; x += 40)
    {
      int roll = (int)(Math.random()*6+1);
      test = new dice(x,y,roll);
      test.show();
      sum+=roll;
    }
  }
}
println(sum);
fill(255,255,255);
text("sum:" + sum,275,500);
}



void mousePressed(){
  
      redraw();
  }





class dice
{
  int myX, myY, myRoll;
  dice(int x, int y, int roll)
  {
    myX = x;
    myY = y;
    myRoll = roll;
  }
  void show()
  {
    int one = 255;
    int two = 255;
    int three = 255;
    int four = 255;
    int five = 255;
    int six = 255;
    int seven = 255;
    
    if(myRoll == 1){
    seven = 0;
    } else if(myRoll == 2){
    two = 0;
    five = 0;
    } else if(myRoll == 3){
    two = 0;
    five = 0;
    seven = 0;
    } else if(myRoll == 4){
    one = 0;
    four = 0;
    six = 0;
    three = 0;
    } else if(myRoll == 5){
    one = 0;
    four = 0;
    six = 0;
    three = 0;
    seven = 0;
    } else if(myRoll == 6){
    one = 0;
    four = 0;
    six = 0;
    three = 0;
    two = 0;
    five = 0;
    }
    noStroke();
    fill(255,255,255);
    rect(myX,myY,31,31);
    
    fill(one);
    ellipse(myX + 5, myY + 5, 5, 5);
    fill(two);
    ellipse(myX + 5, myY + 15, 5, 5);
    fill(three);
    ellipse(myX + 5, myY + 25, 5, 5);
    fill(four);
    ellipse(myX + 25, myY + 5, 5, 5);
    fill(five);
    ellipse(myX + 25, myY + 15, 5, 5);
    fill(six);
    ellipse(myX + 25, myY + 25, 5, 5);
    fill(seven);
    ellipse(myX + 15, myY + 15, 5, 5);
    
  }
}
