import processing.sound.*;
//declaring my vars...//////////////////////////////////////////
int state;

Player p1;

Animation skeletonAnimation;
PImage[] skeletonImages = new PImage [5];

Animation skeletonAttack;
PImage[] skeletonAttackImages = new PImage [4];
PImage skeletonOw;

PImage startScreen;
PImage winScreen;
PImage loseScreen;


Animation knightAnimation;
PImage[] knightImages = new PImage [5];

Animation knightAttack;
PImage[] knightAttackImages = new PImage [5];

Animation knightOw;
PImage[] knightOwImages = new PImage [2];




SoundFile swooshSound;
SoundFile dungeon;

Enemy eA1;
Enemy eA2;
ArrayList<Enemy> enemyListA;

Enemy eB1;
Enemy eB2;
Enemy eB3;
ArrayList<Enemy> enemyListB;

Enemy eC1;
Enemy eC2;
Enemy eC3;
Enemy eC4;
ArrayList<Enemy> enemyListC;

Obstacle oAW1;
Obstacle oAW2;
Obstacle oAW3;
Obstacle oAW4;
Obstacle oAW5;
Obstacle oAW6;
Obstacle oAW7;
Obstacle oAS;
Obstacle oAK1;
ArrayList<Obstacle> obstacleListA;

Obstacle oBW1;
Obstacle oBW2;
Obstacle oBW3;
Obstacle oBW4;
Obstacle oBW5;
Obstacle oBW6;
Obstacle oBW7;
Obstacle oBW8;
Obstacle oBW9;
Obstacle oBW10;
Obstacle oBW11;
Obstacle oBW12;
Obstacle oBS;
Obstacle oBK1;
Obstacle oBK2;
Obstacle oBK3;
Obstacle oBK4;
ArrayList<Obstacle> obstacleListB;

Obstacle oCW1;
Obstacle oCW2;
Obstacle oCW3;
Obstacle oCW4;
Obstacle oCW5;
Obstacle oCW6;
Obstacle oCW7;
Obstacle oCW8;
Obstacle oCW9;
Obstacle oCW10;
Obstacle oCW11;
Obstacle oCW12;
Obstacle oCW13;
Obstacle oCW14;
Obstacle oCW15;
Obstacle oCW16;
Obstacle oCW17;
Obstacle oCW18;
Obstacle oCW19;
Obstacle oCS;
Obstacle oCK1;
ArrayList<Obstacle> obstacleListC;

//milis timer stuff
  int startTime;
  int endTime;
  int interval = 400;

//////////////////////////////////////////////////////  setup  /////////////////////////////////////////////////////////////////////
void setup(){
  imageMode(CENTER);
  rectMode(CENTER);
  size(1200,800);
  state = 0;
//screens
  startScreen = loadImage("startScreen.png");
  winScreen = loadImage("winScreen.png");
  loseScreen = loadImage("loseScreen.png");
 
  //animation stuff
//////// ENEMY  
  //enemy hit animation
  skeletonOw = loadImage("skeletonOw.png");
  float skeletonOwScale = .82;
  skeletonOw.resize(int (skeletonOw.width * skeletonOwScale), int(skeletonOw.height * skeletonOwScale));
  
  //enemy walk animation
  for (int i = 0; i < skeletonImages.length; i++){
  skeletonImages[i] = loadImage("skeleton" + i + ".png");
  }
    skeletonAnimation = new Animation (skeletonImages, .05, 0.8);
 
 //enemy attack animation
  for (int i = 0; i < skeletonAttackImages.length; i++){
  skeletonAttackImages[i] = loadImage("skeletonAttack" + i + ".png");
  }
    skeletonAttack = new Animation (skeletonAttackImages, .5, 0.8);
    
    
/////// KNIGHT
  //knight hit
  for (int i = 0; i < knightOwImages.length; i++){
  knightOwImages[i] = loadImage("knightOw" + i + ".png");
  }
    knightOw = new Animation (knightOwImages, .09, 0.8);
    
  
 //knight walk animation
  for (int i = 0; i < knightImages.length; i++){
  knightImages[i] = loadImage("knight" + i + ".png");
  }
    knightAnimation = new Animation (knightImages, .09, 0.8);
    
    
 //knight attack animation
  for (int i = 0; i < knightAttackImages.length; i++){
  knightAttackImages[i] = loadImage("knightAttack" + i + ".png");
  }
    knightAttack = new Animation (knightAttackImages, .3, 0.8);






    
 startTime = millis();
    
  //int vars
    p1 = new Player(200, height/2, 50, 50);
  
 swooshSound = new SoundFile(this, "2096_whoosh-03.wav");
 dungeon = new SoundFile(this, "bit-dungeon.mp3");
 
 //level A
    eA1 = new Enemy(800,250,50,50);
    eA2 = new Enemy(800,550,50,50);
enemyListA = new ArrayList<Enemy>();
      enemyListA.add(eA1);
      enemyListA.add(eA2);

    oAW1 = new Obstacle(width/2, 150, 900, 40);
    oAW2 = new Obstacle (150, 400, 40, 500);
    oAW3 = new Obstacle (width/2 ,650, 900, 40);
    oAW4 = new Obstacle (1050, 230, 40, 150);
    oAW5 = new Obstacle (1050, 580, 40, 150);
    oAW6 = new Obstacle (1200, 300, 300, 40);
    oAW7 = new Obstacle (1200, 500, 300, 40);
    oAS = new Obstacle (width, height/2, 40, 200);
    oAK1 = new Obstacle (width/2, height/2, 60, 60);
 obstacleListA = new ArrayList<Obstacle>();
      obstacleListA.add(oAW1);
      obstacleListA.add(oAW2);
      obstacleListA.add(oAW3);
      obstacleListA.add(oAW4);
      obstacleListA.add(oAW5);
      obstacleListA.add(oAW6);
      obstacleListA.add(oAW7);
      obstacleListA.add(oAS);
      obstacleListA.add(oAK1);
      
  //level B
    eB1 = new Enemy(300,600,50,50);
    eB2 = new Enemy(600,200,50,50);
    eB3 = new Enemy(900,700,50,50);
  enemyListB = new ArrayList<Enemy>();
      enemyListB.add(eB1);
      enemyListB.add(eB2);
      enemyListB.add(eB3);
      
   oBW1 = new Obstacle(0, 500, 300, 40);
   oBW2 = new Obstacle(0, 300, 300, 40);
   oBW3 = new Obstacle(0, 400, 40, 200);
   oBW4 = new Obstacle(150, 200, 40, 200);
   oBW5 = new Obstacle(150, 600, 40, 200);
   oBW6 = new Obstacle(350, 100, 400, 40);
   oBW7 = new Obstacle(450, 700, 600, 40);
   oBW8 = new Obstacle(550, 50, 40, 100);
   oBW9 = new Obstacle(750, 750, 40, 100);
   oBW10 = new Obstacle(700, 10, 300, 40);
   oBW11 = new Obstacle(900, 800, 300, 40);
   oBW12 = new Obstacle(1050, 400, 40, 800);
                 oBS = new Obstacle(950, 10, 200, 40);
   oBK1 = new Obstacle (800, 200, 60, 60);
   oBK2 = new Obstacle (900, 500, 60, 60);
   oBK3 = new Obstacle (300, 300, 60, 60);
   oBK4 = new Obstacle (600, 500, 60, 60);
obstacleListB = new ArrayList<Obstacle>();
      obstacleListB.add(oBW1);
      obstacleListB.add(oBW2);
      obstacleListB.add(oBW3);
      obstacleListB.add(oBW4);
      obstacleListB.add(oBW5);
      obstacleListB.add(oBW6);
      obstacleListB.add(oBW7);
      obstacleListB.add(oBW8);
      obstacleListB.add(oBW9);
      obstacleListB.add(oBW10);
      obstacleListB.add(oBW11);
      obstacleListB.add(oBW12);
                obstacleListB.add(oBS);
      obstacleListB.add(oBK1);
      obstacleListB.add(oBK2);
      obstacleListB.add(oBK3);
      obstacleListB.add(oBK4);
      
 //level C
    eC1 = new Enemy(400,200,50,50);
    eC2 = new Enemy(800,200,50,50);
    eC3 = new Enemy(200,400,50,50);
    eC4 = new Enemy(1000,400,50,50);
  enemyListC = new ArrayList<Enemy>();
      enemyListC.add(eC1);
      enemyListC.add(eC2);
      enemyListC.add(eC3);
      enemyListC.add(eC4);
      
      oCW1 = new Obstacle(600,800,200,40);  
    oCW2 = new Obstacle(500,750,40,100); 
    oCW3 = new Obstacle(700,750,40,100); 
      oCW4 = new Obstacle(400,700,200,40);
      oCW5 = new Obstacle(800,700,200,40);
    oCW6 = new Obstacle(300,650,40,100);
    oCW7 = new Obstacle(900,650,40,100);
      oCW8 = new Obstacle(200,600,200,40);
      oCW9 = new Obstacle(1000,600,200,40);
    oCW10 = new Obstacle(1100,400,40,400);
    oCW11 = new Obstacle(100,400,40,400);
      oCW12 = new Obstacle(200,200,200,40);
      oCW13 = new Obstacle(1000,200,200,40);
    oCW14 = new Obstacle(300,150,40,100);
    oCW15 = new Obstacle(900,150,40,100);
      oCW16 = new Obstacle(400,100,200,40);
      oCW17 = new Obstacle(800,100 ,200,40);
    oCW18 = new Obstacle(500,50,40,100); 
    oCW19 = new Obstacle(700,50,40,100);
                  oCS = new Obstacle(600,0,200,40); 
    oCK1 = new Obstacle(width/2,height/2,60,60); 
obstacleListC = new ArrayList<Obstacle>();
      obstacleListC.add(oCW1);
      obstacleListC.add(oCW2);
      obstacleListC.add(oCW3);
      obstacleListC.add(oCW4);
      obstacleListC.add(oCW5);
      obstacleListC.add(oCW6);
      obstacleListC.add(oCW7);
      obstacleListC.add(oCW8);
      obstacleListC.add(oCW9);
      obstacleListC.add(oCW10);
      obstacleListC.add(oCW11);
      obstacleListC.add(oCW12);
      obstacleListC.add(oCW13);
      obstacleListC.add(oCW14);
      obstacleListC.add(oCW15);
      obstacleListC.add(oCW16);
      obstacleListC.add(oCW17);
      obstacleListC.add(oCW18);
      obstacleListC.add(oCW19);
      obstacleListC.add(oCS);
      obstacleListC.add(oCK1);
      
      dungeon.rate(1);
      
    

}

//////////////////////////////////  draw  //////////////////////////////////////////////////////////////////
void draw(){
  background(0);
  levelHandler();
endTime = millis();  
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void levelHandler(){
//state machine :(
  switch(state){
/////////////////////////////////////////////////////////////   OPEN SCREEN 
    case 0:
      background(startScreen);
      textAlign(CENTER);
      break;
      
////////////////////////////////////////////////////////////  LEVEL A 
   case 1:
    p1.render();
    p1.move();
    p1.weapon();
  
    
   if(dungeon.isPlaying() == false){
    dungeon.play();
    dungeon.amp(.6);
     }
  //enemy list
    for (Enemy anEnemy : enemyListA){
      anEnemy.render();
     anEnemy.weapon();
     anEnemy.move(p1);
      anEnemy.hitEnemy(p1);
      anEnemy.enemyAttack();
      anEnemy.hitPlayer(p1);
    }
  //for dead enemies
   for (int i = enemyListA.size()-1; i >= 0; i=i-1){
     Enemy anEnemy = enemyListA.get(i);
       if (anEnemy.isDead == true){
         enemyListA.remove(anEnemy);
       }
   }
   
  // for loop to go through ob list
  for (Obstacle anObstacle : obstacleListA){
    anObstacle.render();
    anObstacle.playerCollide(p1);
    for (Enemy anEnemy : enemyListA){
      anObstacle.enemyCollide(anEnemy);
      }
    }
  //to open next level
  if(enemyListA.size() == 0){ obstacleListA.remove(oAS);}
 
     break;
     
     
  
///////////////////////////////////////////////////////////  LEVEL B  
  case 2:
    p1.render();
    p1.move();
    p1.weapon();
  
   if(dungeon.isPlaying() == false){
    dungeon.play();
     }
  //enemy list
    for (Enemy anEnemy : enemyListB){
      anEnemy.render();
      anEnemy.weapon();
      anEnemy.move(p1);
      anEnemy.hitEnemy(p1);
      anEnemy.enemyAttack();
      anEnemy.hitPlayer(p1);
    }
  //for dead enemies
   for (int i = enemyListB.size()-1; i >= 0; i=i-1){
     Enemy anEnemy = enemyListB.get(i);
       if (anEnemy.isDead == true){
         enemyListB.remove(anEnemy);
       }
   }
   
  // for loop to go through ob list
  for (Obstacle anObstacle : obstacleListB){
    anObstacle.render();
    anObstacle.playerCollide(p1);
    for (Enemy anEnemy : enemyListB){
      anObstacle.enemyCollide(anEnemy);
      }
    }
  //to open next level
  if(enemyListB.size() == 0){ obstacleListB.remove(oBS);}
break;
      
/////////////////////////////////////////////////////////   LEVEL C 
  case 3:
    p1.render();
    p1.move();
    p1.weapon();
    
    if(dungeon.isPlaying() == false){
    dungeon.play();
    }
        //enemy list
    for (Enemy anEnemy : enemyListC){
      anEnemy.render();
      anEnemy.weapon();
      anEnemy.move(p1);
      anEnemy.hitEnemy(p1);
      anEnemy.enemyAttack();
      anEnemy.hitPlayer(p1);
    }
  //for dead enemies
   for (int i = enemyListC.size()-1; i >= 0; i=i-1){
     Enemy anEnemy = enemyListC.get(i);
       if (anEnemy.isDead == true){
         enemyListC.remove(anEnemy);
       }
   }
   
  // for loop to go through ob list
  for (Obstacle anObstacle : obstacleListC){
    anObstacle.render();
    anObstacle.playerCollide(p1);
    for (Enemy anEnemy : enemyListC){
      anObstacle.enemyCollide(anEnemy);
      }
    }
        //to open next level
   if(enemyListC.size() == 0){ obstacleListC.remove(oCS);}
break;
    
  //////////////////////////////////////////////////////////////   WIN SCREEN 
  case 4:
   background(winScreen);
      textAlign(CENTER);
      textSize(80);
      fill(#C98C8C);
      text ("20",width/2,height/2+125);
      
    break;
    
  /////////////////////////////////////////////////////////////  LOOSE SCREEN 
  case 5:
     background(loseScreen);
      textAlign(CENTER);
      textSize(80);
      fill(#C98C8C);
      text ("1",width/2,height/2+125);
    break;
  }
  
}
  
//////////////functions///////////////////////////////////////////////////////////

void keyPressed(){
   if (key == 'w'){ p1.isMovingUp = true; }
   if (key == 's'){ p1.isMovingDown = true; }
   if (key == 'a'){ p1.isMovingLeft = true; }
   if (key == 'd'){ p1.isMovingRight = true; }
   if (key == 'r' && state == 0) { state = 1; }
}
void keyReleased(){
   if (key == 'w'){ p1.isMovingUp = false; }
   if (key == 's'){ p1.isMovingDown = false; }
   if (key == 'a'){ p1.isMovingLeft = false; }
   if (key == 'd'){ p1.isMovingRight = false; }
}
void mousePressed(){
  if (mousePressed == true){ swooshSound.play();
  p1.attacking = true; println ("attacking!"); p1.animationState = 1; knightAttack.isAnimating = true;}
}
void mouseReleased(){
  if (mousePressed == false){ p1.attacking = false; }
}
