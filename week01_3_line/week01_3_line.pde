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
