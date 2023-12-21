import processing.sound.*;
SoundFile file;
ArrayList<PVector> floor = new ArrayList<PVector>();
int st = 0, state = 0;

float marioX = 100, marioY = 180, vx = 0, vy = 0;

void setup() {
  size(400, 600);
  
  floor.add(new PVector(50, 200));
  floor.add(new PVector(random(100, 200), 300));
  floor.add(new PVector(random(100, 200), 400));
  floor.add(new PVector(random(100, 200), 500));
  file=new SoundFile(this,"bgm.mp3");
  file.play();
}

void draw() {
  if (state == 0) {
    drawStartScreen();
  } else if (state == 1) {
    gamePlay();
  }  else if (state == 2) {
    gamePlay2();
  } else if (state == 3) {
    // Handle game over state
    background(#9B0B28);
    textSize(40);
    fill(255);
    text("Game Over", 100, 250);
    text("Press SPASE to restart", 20, 300);
  }
}

void drawStartScreen() {
  background(0, 0, 255);
  textSize(40);
  fill(0);
  text("EASY Press '1'\nHARD Press '2'", 30, 250);
  textSize(20);
  fill(0);
  text("LEFT=left\nRIGHT=right\nSPACE=jump", 250, 350);
}

void gamePlay() {
  background(#F7DCDC);
  updateMario();
  drawMario();
  for (PVector p : floor) {
    rect(p.x, p.y, 100, 20);
    p.y -= 2;
  }
  if (floor.get(0).y < -20) floor.remove(0);
  if (frameCount % 100 == 1) {
    floor.add(new PVector(random(1, 300), 600));
  }
}
void gamePlay2() {
  background(#F7DCDC);
  updateMario();
  drawMario();
  for (PVector p : floor) {
    rect(p.x, p.y, 100, 20);
    p.y -= 4;
  }
  if (floor.get(0).y < -20) floor.remove(0);
  if (frameCount % 50 == 1) {
    floor.add(new PVector(random(1, 300), 600));
  }
}
void updateMario() {
  marioX += vx;
  marioY += vy;
  vy += 0.98;
  for (PVector p : floor) {
    if (marioY > p.y && marioY < p.y + 20 && marioX > p.x && marioX < p.x + 100) {
      marioY = p.y - 10;
      vy = 0;
      flying = false;
    }
  }
  if (marioY > height || marioY < 1) {
    state = 3; // Set game over state
  }
}

void drawMario() {
  fill(255, 0, 0);
  ellipse(marioX, marioY, 15, 25);
}

boolean hitBox(int x, int y, int w, int h) {
  if (x - 7 < marioX && marioX < x + w + 7 && y - 10 < marioY && marioY < y + h + 10) return true;
  else return false;
}
boolean flying = false;
void keyPressed() {
  if (keyCode == RIGHT) vx = 4;
  if (keyCode == LEFT) vx = -4;
  if (keyCode == 32 && !flying) {
    vy = -13;
    flying = true;
  }

  if (state == 0 && keyCode == '1') {
    state = 1;
  }
  if (state == 0 && keyCode == '2') {
    state = 2;
  }
  if (state == 3 && keyCode == 32) {
    resetGame();
  }
    
}

void keyReleased() {
  if (keyCode == RIGHT || keyCode == LEFT) vx = 0;

}

void mousePressed() {
  // RESET
  
}

void resetGame() {
  marioX = 100;
  marioY = 180;
  vx = 0;
  vy = 0;
  state = 0;
  floor.clear();
  floor.add(new PVector(50, 200));
  floor.add(new PVector(random(100, 200), 300));
  floor.add(new PVector(random(100, 200), 400));
  floor.add(new PVector(random(100, 200), 500));
}
