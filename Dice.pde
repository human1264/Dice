dice test;
dice replace;
String list = "";
int sum = 0;
int ret = 0;
void setup(){
size(600,600);
noLoop();
background(0,0,0);
//first screen shown
for(int y = 0; y <= 400; y += 35)
{
  {
    for(int x = 0; x <= 600; x += 40)
    { 
      int roll = (int)(Math.random()*6+1);
      list = list + roll;
      sum+=roll;
      test = new dice(x,y,roll);
      test.show();
      
    }
  }
}

}




void draw(){

if(mouseY > 410){
//redraws entire screen and updates accordingly
list = "";
sum = 0;
background(0,0,0);
for(int y = 0; y <= 400; y += 35)
{
  {
    for(int x = 0; x <= 600; x += 40)
    { 
      int roll = (int)(Math.random()*6+1);
      list = list + roll;
      test = new dice(x,y,roll);
      test.show();
      sum+=roll;
    }
  }
} 
} else if (mouseY <= 410) {
//rolls single dice again
int roll = (int)(Math.random()*6+1);
//note:the value of the dice that is replaced has already been subtracted from the total
sum += roll;
//changes spot in list to new number
int above = (mouseY - (mouseY%35))/35;
above = above * 16;
int before = (mouseX - (mouseX%40))/40;
int num = above + before + 1;
list = list.substring(0,num-1) + roll + list.substring(num);
  
//draws new dice
replace = new dice(mouseX - (mouseX%40), mouseY - (mouseY%35), roll);
replace.show();
fill(0,0,0);
quad(0,420,600,420,600,600,0,600);
}else {}
//draws text for sum
fill(255,255,255);
text("sum:" + sum,275,500);
}



void mousePressed(){
   //find which dice is clicked
    if (mouseY <= 410){
   int above = (mouseY - (mouseY%35))/35;
   above = above * 16;
   int before = (mouseX - (mouseX%40))/40;
   int num = above + before + 1;
   //find the value of that dice and converts to int
   String temp = list.substring(num-1, num);
   ret = Integer.parseInt(temp);
   //subtract value of that dice from total
   sum -= ret;
    
  }
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
    //colors dots according to the roll
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
    //draws the square part of the dice
    noStroke();
    fill(255,255,255);
    rect(myX,myY,31,31);
    //set each dot to needed color
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
