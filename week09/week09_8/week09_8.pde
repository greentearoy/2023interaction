PImage img;
int [][]pos={{93,490},{246,524},{177,524},{161,490},{152,456},{196,490},{230,490},{263,490},{322,457},{298,490},{332,490},{366,491},{314,524},{281,524},{357,456},{391,456},{83,457},{185,457},{126,491},{221,456},{289,457},{212,524},{118,456},{143,525},{255,457},{110,524}};
void setup(){
  size(800,600);
  img=loadImage("keyboard.png");
  rectMode(CENTER);
}
void draw(){
  background(#FFFFF2);
  image(img,0,600-266);
  fill(255,0,0,128);
  rect(mouseX,mouseY,28,30,5);
  fill(0,255,0,128);
  for(int i=0;i<26;i++){
    if(ID<typing.length()&&typing.charAt(ID)-'a'==i)rect(pos[i][0],pos[i][1],28,30,5);
    if(pressed[i])rect(pos[i][0],pos[i][1],28,30,5);
  }
  fill(0);
  textSize(50);
  text(typing,50,50);
  text(typed,50,100);
  fill(255,0,0);
  if(ID<typing.length())text(typed + typing.charAt(ID),50,100);
  fill(0);
  text(typed,50,100);
}
String typing="printfprintfprintf";
String typed="";
int ID=0;
boolean [] pressed=new boolean[26];
void keyPressed(){
  if(key>='a'&&key<='z'){
    if(key==typing.charAt(ID)){
      pressed[key-'a']=true;
      typed+=key;
      ID++;
    }else{
      background(255,0,0);
    }
  }
}
void keyReleased(){
  if(key>='a'&&key<='z')pressed[key-'a']=false;
}
void mousePressed(){
  println(mouseX,mouseY);
}
