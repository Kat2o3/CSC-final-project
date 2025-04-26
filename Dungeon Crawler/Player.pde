class Player{
  
//vars
  int x;
  int y;
  int w;
  int h;
  
  color c;
  
  int left;
  int right;
  int top;
  int bottom;
  
  int weaponLeft;
  int weaponRight;
  int weaponTop;
  int weaponBottom;
  
    boolean attacking;
  
  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isMovingUp;
  boolean isMovingDown;
  
  int speed;
  
  int hitCount = 0;
  
  int animationState = 0;
  
//constructor////////////////////////////////////////////////////////////////
  Player(int startingX, int startingY, 
  int startingW, int startingH){
    
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    c = color(255,255,255);
    
  left = x - w/2;
  right = x + w/2;
  top = y - h/2;
  bottom = y + h/2;
  
   weaponLeft = left;
   weaponRight = right;
   weaponTop = top;
   weaponBottom = bottom;
  
  isMovingLeft = false;
  isMovingRight = false;
  isMovingUp = false;
  isMovingDown = false;
  
  attacking = false;
  
  speed = 5;
  
    
  }
  
//functions//////////////////////////////////////////////////////////

  void render(){
    fill(c);
  //  rect(x, y, w, h);
  
 
  switch(animationState){
    // walking animation
    case 0:
      knightAnimation.display(x,y);
      break;
    // attacking animation;
    case 1: 
      knightAttack.display(x,y);
      break;
   //hurt animation
   case 2:
     knightOw.display(x,y);
   break;
  }
  
  if (animationState == 1 && knightAttack.isAnimating == false){
     animationState = 0; 
  }
    if (animationState == 2 && knightOw.isAnimating == false){
     animationState = 0; 
  }
  }
  
  void move(){
  left = x - w/2;
  right = x + w/2;
  top = y - h/2;
  bottom = y + h/2;
  
  
 if (isMovingUp == true){ y = y - speed; knightAnimation.isAnimating = true;}
 if (isMovingDown == true){ y = y + speed; knightAnimation.isAnimating = true;}
 if (isMovingLeft == true){ x = x - speed; knightAnimation.isAnimating = true;}
 if (isMovingRight == true){ x = x + speed; knightAnimation.isAnimating = true;}
  
 //move to level B
 if (x-w/2 >= width && state == 1){
   state = 2;
   x = 100;
   y = height/2;
 }
 //move to level C
if (y+h/2 <=  0 && state == 2){
   state = 3;
   x = 600;
   y = 750;
  }
   //move to win
if (y+h/2 <=  0 && state == 3){
   state = 4;
  }
}
  //weapon/how does it attack
  void weapon(){
 if (attacking == true){   
   weaponLeft = left - 50;
   weaponRight = right + 50;
   weaponTop = top - 50;
   weaponBottom = bottom + 50;}

  
  }





















  
  
}
