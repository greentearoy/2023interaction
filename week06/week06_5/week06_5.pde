import processing.sound.*;
//https://processing.org/reference/libraries/sound/SoundFile.html
SoundFile file;
void setup(){
  size(300,300);
  file = new SoundFile(this,"a.mp3");
  file.play();
}
void draw(){
  
}
