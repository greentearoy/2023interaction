ArrayList<PVector>pt;//大的資料結構ArrayList
void setup(){
  size(400,400,P3D);
  pt=new ArrayList<PVector>();
}//初始化，放小的資料結構
void draw(){
  background(#F7F7CF);
  pushMatrix();
    if(mousePressed && mouseButton==RIGHT){
      translate(200,200);
      rotateY(radians(frameCount));
      translate(-200,-200);
    }
    for(PVector p:pt){
      ellipse(p.x,p.y,10,10);
    }
    beginShape();
    for(PVector p:pt){
      vertex(p.x,p.y);
    }
    endShape();
  popMatrix();
}
void mousePressed(){
  if(mouseButton==LEFT){
    pt.add(new PVector(mouseX,mouseY));  
  }
}//大的資料結構加入小的PVector物件
