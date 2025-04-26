class Enemy{
  //vars
  int x;
  int y;
  int w;
  int h;
  
  color c;
  
  int weaponLeft;
  int weaponRight;
  int weaponTop;
  int weaponBottom;
  
    boolean attacking;
  
  int left;
  int right;
  int top;
  int bottom;
  
  int speed;
    
    int hitCount = 0;
    boolean isDead;
    
  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isMovingUp;
  boolean isMovingDown;
  
  int animationState = 0;
    
 
 //constructor////////////////////////////////////////////////////////////////
  Enemy(int startingX, int startingY, int startingW, int startingH){
  x = startingX;
  y = startingY;
  w = startingW;
  h = startingH;
  
isDead = false;
  
  c = color (255,0,0);
  
  left = x - w/2;
  right = x + w/2;
  top = y - h/2;
  bottom = y + h/2;
  
  speed = 2;
  
   weaponLeft = left;
   weaponRight = right;
   weaponTop = top;
   weaponBottom = bottom;
   
   attacking = false;
   
  isMovingLeft = false;
  isMovingRight = false;
  isMovingUp = false;
  isMovingDown = false;
  
  }
//functions////////////////////////////////////////////////////////////////
//make it appear...
void render(){
  fill(c);
  //rect(x,y,w,h);
  
  switch(animationState){
    // walking animation
    case 0:
      skeletonAnimation.display(x,y);
      break;
    // attacking animation;
    case 1: 
      skeletonAttack.display(x,y);
      break;
  }
  
  if (animationState == 1 && skeletonAttack.isAnimating == false){
     animationState = 0; 
  }
  
  
  
  
 
  
}

//make it move
void move(Player aPlayer){
  left = x - w/2;
  right = x + w/2;
  top = y - h/2;
  bottom = y + h/2;
  

 if (isMovingUp == true){ y = y - speed; }
 if (isMovingDown == true){ y = y + speed;}
 if (isMovingLeft == true){ x = x - speed;}
 if (isMovingRight == true){ x = x + speed;}
 
  if(aPlayer.x <= x){x = x - speed;}
  if(aPlayer.x >= x){x = x + speed;}
  if(aPlayer.y <= y){y = y - speed;}
  if(aPlayer.y >= y){y = y + speed;}
    skeletonAnimation.isAnimating = true;
    
}


 //player hitting
  void hitEnemy(Player aPlayer){
    if (aPlayer.attacking == true &&
        top <= aPlayer.weaponBottom &&
        bottom >= aPlayer.weaponTop &&
        left <= aPlayer.weaponRight &&
        right >= aPlayer.weaponLeft){
          println ("whack");
          
        image(skeletonOw,x,y);
        
           hitCount = hitCount + 1;
           aPlayer.weaponLeft = aPlayer.left;
           aPlayer.weaponRight = aPlayer.right;
           aPlayer.weaponTop = aPlayer.top;
           aPlayer.weaponBottom = aPlayer.bottom;
      }
          if (state == 1 && hitCount >= 15) {isDead=true;}
          if (state == 2 && hitCount >= 20) {isDead=true;}
          if (state == 3 && hitCount >= 30) {isDead=true;}
  }
  
  
  //weapon function
    void weapon(){
 if (attacking == true){   
   weaponLeft = left - 50;
   weaponRight = right + 50;
   weaponTop = top - 50;
   weaponBottom = bottom + 50;}
  }  
  
//enemy attack function..?
void enemyAttack(){
  if (endTime - startTime >= interval){
    print("rah!");
    attacking = true;
     
     skeletonAttack.isAnimating = true;
    animationState = 1;
    startTime = millis();
  }
      else{attacking = false;}
}
  
  
  
//player is hit
    void hitPlayer(Player aPlayer){
    
    if (attacking == true &&
        aPlayer.top <= weaponBottom &&
       aPlayer.bottom >= weaponTop &&
        aPlayer.left <= weaponRight &&
       aPlayer.right >= weaponLeft){
         
          aPlayer.hitCount = aPlayer.hitCount + 1;
          knightOw.isAnimating = true;
          aPlayer.animationState = 2;
          println ("ow!");
           weaponLeft = left;
           weaponRight = right;
           weaponTop = top;
           weaponBottom = bottom;
        }
    if (aPlayer.hitCount >= 4) {state = 5;}
  }
  
  
  
  
  
  
  
  
  
  
  
}
