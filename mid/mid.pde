void setup(){
  size(400,600);
  
}
int g=400,st=0,state=0;
float marioX=50,marioY=250,vx=0,vy=0;
void draw(){
  if(state==0){
    background(0,0,255);
    textSize(40);
    fill(0);text("Push Space to Start",30,250);
    textSize(20);
    fill(0);text("LEFT=left\nRIGHT=right\nSPACE=jump",250,350);
  }else if(state==1){
    if(st==0){  //start falling
      flying=true;
      st+=1;
    }
    background(108,137,255);
    marioX+=vx;
      if(flying){
      marioY+=vy;
      vy+=0.98;
      if(marioY>600||marioY<1){
        state=2;
      }
    }
    fill(255,0,0);ellipse(marioX,marioY,15,25);
    drawAndTrueBox(20,g--,100,20);
  }else if(state==2){
    background(0,0,255);
    textSize(50);
    fill(0);text("End Game",85,250);
  }
}
void drawAndTrueBox(int x,int y,int w,int h){ //box setting
   fill(299,119,42);rect(x,y,w,h);
  if(hitBox(x,y,w,h)){
    if(vy>0){
      marioY=y-10;
      flying=false;
      stand_box=true;
    }else{
      vy=0;
      marioY=y+h+10;
    }
  }
  if(stand_box==true && flying==false && leaveBox(x,y,w,h)){
    stand_box=false;
    flying=true;
    vy=0;
  }
}

boolean leaveBox(int x,int y,int w,int h){
  if(x-7>marioX || marioX>x+w+7)return true;
  else return false;
}
boolean hitBox(int x,int y,int w,int h){
  if(x-7<marioX && marioX<x+w+7 && y-10<marioY && marioY<y+h+10)return true;
  else return false;
}
boolean flying=false,stand_box=false;
void keyPressed(){
  if(keyCode==RIGHT)vx=4;
  if(keyCode==LEFT)vx=-4;  
  if(keyCode==32 && flying==false){
    vy=-13;
    flying=true;
    stand_box=false;
  }
  if(state==0&&keyCode==32){
    if(state==0)state=1;
  }
}
void keyReleased(){
  if(keyCode==RIGHT||keyCode==LEFT)vx=0;
}
