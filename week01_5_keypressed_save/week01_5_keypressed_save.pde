//互動模式
void setup(){ //設定
  size(500,500);
  background(255);
}
void draw(){ //畫圖
  if(mousePressed){ //按mouse
    line(mouseX,mouseY,pmouseX,pmouseY); //畫線
  }
}
void keyPressed(){ //按鍵改顔色
  if(key=='1')stroke(255,0,0);
  if(key=='2')stroke(0,255,0);
  if(key=='3')stroke(0,0,255);
  if(key=='s'||key=='S')save("output.png"); //按s/S存檔
}
