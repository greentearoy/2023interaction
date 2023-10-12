void setup(){
  size(400,400,P3D);//3D功能
}
void draw(){
  background(#F7F7CF);
  pushMatrix();
    translate(mouseX,mouseY);
    rotateY(radians(mouseX));//Y軸轉動
    fill(0,255,0);
    box(100);//3D盒子
    
    noFill();
    scale(2);
    box(100);//3D盒子
  popMatrix();
}
