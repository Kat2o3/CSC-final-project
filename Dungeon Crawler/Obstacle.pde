class Obstacle {
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
  
  
//constructor////////////////////////////////////////////////////////
Obstacle(int startingX, int startingY, int startingW, int startingH){
  x = startingX;
  y = startingY;
  w = startingW;
  h = startingH;
  
  c = color(#D8D0D0);
  
  left = x - w/2;
  right = x + w/2;
  top = y - h/2;
  bottom = y + h/2;
  
}
  
//functions//////////////////////////////////////////////////////////////////
void render(){
  fill(c);
  noStroke();
  rect(x,y,w,h);
}












void playerCollide(Player aPlayer){
  //left side collison
  if (aPlayer.top <= bottom &&
      aPlayer.bottom >= top &&
      aPlayer.right > left &&
      aPlayer.left <= left){
        aPlayer.isMovingRight = false;
        aPlayer.x = left - aPlayer.w/2;
      }
       //Right side collison
  if (aPlayer.top <= bottom &&
      aPlayer.bottom >= top &&
      aPlayer.left < right &&
      aPlayer.right >= right){
        aPlayer.isMovingLeft = false;
        aPlayer.x = right + aPlayer.w/2;
      }
 //Top side collison
  if (aPlayer.left <= right &&
      aPlayer.right >= left &&
      aPlayer.bottom > top &&
      aPlayer.top <= top){
        aPlayer.isMovingDown = false;
        aPlayer.y = top - aPlayer.h/2;
    }
 //Bottom side collison
  if (aPlayer.left <= right &&
      aPlayer.right >= left &&
      aPlayer.top < bottom &&
      aPlayer.bottom >= bottom){
        aPlayer.isMovingUp = false;
        aPlayer.y = bottom + aPlayer.h/2;
    }
  }
  
  
  void enemyCollide(Enemy aEnemy){
    //left side collison
  if (aEnemy.top <= bottom &&
      aEnemy.bottom >= top &&
      aEnemy.right > left &&
      aEnemy.left <= left){
        aEnemy.isMovingRight = false;
        aEnemy.x = left - aEnemy.w/2;
      }
       //Right side collison
  if (aEnemy.top <= bottom &&
      aEnemy.bottom >= top &&
      aEnemy.left < right &&
      aEnemy.right >= right){
        aEnemy.isMovingLeft = false;
        aEnemy.x = right + aEnemy.w/2;
      }
 //Top side collison
  if (aEnemy.left <= right &&
      aEnemy.right >= left &&
      aEnemy.bottom > top &&
      aEnemy.top <= top){
        aEnemy.isMovingDown = false;
        aEnemy.y = top - aEnemy.h/2;
    }
 //Bottom side collison
  if (aEnemy.left <= right &&
      aEnemy.right >= left &&
      aEnemy.top < bottom &&
      aEnemy.bottom >= bottom){
        aEnemy.isMovingUp = false;
        aEnemy.y = bottom + aEnemy.h/2;
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
