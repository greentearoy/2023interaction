ArrayList<PVector> floor = new ArrayList<PVector>();
int g = 400, st = 0, state = 0, rw = int(random(50, 200)), rx = int(random(10, 390));

float marioX = 100, marioY = 180, vx = 0, vy = 0;

void setup() {
  size(400, 600);
  floor.add(new PVector(random(100, 200), 200));
  floor.add(new PVector(random(100, 200), 300));
  floor.add(new PVector(random(100, 200), 400));
  floor.add(new PVector(random(100, 200), 500));
}

void draw() {
  if (state == 0) {
    drawStartScreen();
  } else if (state == 1) {
    if (st == 0) {  
      // start falling
      flying = true;
      st += 1;
    }
    gamePlay();
  } else if (state == 2) {
    
  }
}

void drawStartScreen() {
  background(0, 0, 255);
  textSize(40);
  fill(0);
  text("Push Space to Start", 30, 250);
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
    state = 2;
  }
}

void drawMario() {
  fill(255, 0, 0);
  ellipse(marioX, marioY, 15, 25);
}

void drawAndTrueBox(int x, int y, int w, int h) {
  fill(#2821FF);
  rect(x, y, w, h);

  if (hitBox(x, y, w, h)) {
    if (vy > 0) {
      marioY = y - 10;
      vy = 0;
      flying = false;
      stand_box = true;
    } else {
      vy = 0;
      marioY = y + h + 10;
    }
  }

  if (stand_box == true && flying == false && leaveBox(x, y, w, h)) {
    stand_box = false;
    flying = true;
    vy = 0;
  }
}

boolean leaveBox(int x, int y, int w, int h) {
  if (x-7 >marioX || marioX>x+w+7) return true;
  else return false;
}

boolean hitBox(int x, int y, int w, int h) {
  if (x-7 <marioX && marioX<x+w+7 && y-10<marioY && marioY<y+h+10) return true;
  else return false;
}

boolean flying = false, stand_box = false;

void keyPressed() {
  if (keyCode == RIGHT) vx = 4;
  if (keyCode == LEFT) vx = -4;
  if (keyCode == 32 && flying == false) {
    vy = -13;
    flying = true;
    stand_box = false;
  }

  if (state == 0 && keyCode == 32) {
    if (state == 0) state = 1;
  }
}

void keyReleased() {
  if (keyCode == RIGHT || keyCode == LEFT) vx = 0;
}

void mousePressed() {// RESET
  
  resetGame();
}

void resetGame() {// RESET
  marioX = 100;
  marioY = 180;
  vx = 0;
  vy = 0;
  state = 0;
  floor.clear();
  floor.add(new PVector(random(100, 200), 200));
  floor.add(new PVector(random(100, 200), 300));
  floor.add(new PVector(random(100, 200), 400));
  floor.add(new PVector(random(100, 200), 500));
}
