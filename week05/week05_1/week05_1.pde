void setup(){
  size(400,400,P3D);//3D功能
}
void draw(){
  background(#F7F7CF);
  pushMatrix();
    translate(mouseX,mouseY);
    box(100);//3D盒子
  popMatrix();
}
