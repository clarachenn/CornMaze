
class Player extends GameObject {

  int timer, haytimer, haynumber, lifetimer, lifenumber, healthtimer, foundlifetimer, corntimer, corntime;

  Player() {
    super (eyex, eyey, eyez, 30);
    lives = 3;
    size = 30;
    canLoseLife = true;
    lTimer = false;
    haytimer = 0;
    lifetimer = 0;
    foundlifetimer = 0;
    corntime = 30;
    corntimer = 0;
  }

  void show() {
    world.pushMatrix();
    world.translate(eyex, eyey, eyez);
    world.noFill();
    world.stroke(10);
    world.sphere(30);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      healthtimer++;
      haytimer++;
      lifetimer++;
      corntimer++;

      if (foundalife) {
        foundlifetimer++;
      }
      if (foundalife && foundlifetimer >= 80) {
        foundalife = false;
        foundlifetimer = 0;
      }
      if (fullhealth) {
        healthtimer++;
      }
      if (fullhealth && healthtimer >= 80) {
        fullhealth = false;
        healthtimer = 0;
      }

      lifenumber = (int)random(1000, 1100);
      haynumber = (int)random(100, 150);

      if (lifetimer >= lifenumber && lives <=2) { //change to 3 if too hard
        objects.add(new LifeBlock());
        lifetimer = 0;
      }
      if (haytimer >= haynumber) {
        objects.add(new Hay());
        haytimer = 0;
      }
      if (lives == 0) {
        mode = YOULOST;
        youlost();
      }
      if (lTimer) {
        timer ++;
      }
      if (timer >= 120) {
        timer = 0;
        lTimer = false;
        canLoseLife = true;
      }
      if (canLoseLife) {
        mode2 = NOTIMMUNE;
      } else if (!canLoseLife) {
        mode2 = IMMUNE;
      }
      if (lives == 1) {
        playerlives = ONEL;
      }
      if (lives == 2) {
        playerlives = TWOL;
      }
      if (lives == 3) {
        playerlives = THREEL;
      }
      if (lives == 4) {
        playerlives = FOURL;
      }
      if (spacekey && corntimer >= corntime) {
        objects.add(new Corn());
        corntimer = 0;
      }
    }
  }
}

void move() {
  if (akey && canMoveLeft()) {
    eyex -= cos(leftRightAngle + PI/2)*10;
    eyez -= sin(leftRightAngle + PI/2)*10;
  }
  if (dkey && canMoveRight()) {
    eyex += cos(leftRightAngle + PI/2)*10;
    eyez += sin(leftRightAngle + PI/2)*10;
  }
  if (skey && canMoveBackward()) {
    eyex -= cos(leftRightAngle)*10;
    eyez -= sin(leftRightAngle)*10;
  }
  if (wkey && canMoveForward()) {
    eyex += cos(leftRightAngle)*10;
    eyez += sin(leftRightAngle)*10;
  }
  if (qkey) {
    objects.add(new Hand());
  }

  focusx = eyex + cos(leftRightAngle)*100 ;
  focusy = eyey + tan(upDownAngle)*100;
  focusz = eyez + sin(leftRightAngle)*100;

  if (frameCount < 2) {
    rbt.mouseMove(width/2, height/2);
    mouseX = width/2;
    mouseY = height/2;
  }
  if (mode == GAME) {
    if (mouseX < 1) {
      rbt.mouseMove(width-2, mouseY);
    } else if (mouseX > width-2) {
      rbt.mouseMove(1, mouseY);
    }
    leftRightAngle += (mouseX - pmouseX)*0.01;
    upDownAngle    += (mouseY - pmouseY)*0.005;
    if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
    if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
  }
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;

  fwdx = eyex + cos(leftRightAngle)*150 ;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*150;

  mapx = int(fwdx + 2000) / gridSize;
  mapy = int(fwdz + 2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBackward() {
  float bkwdx, bkwdy, bkwdz;
  int mapx, mapy;

  bkwdx = eyex + cos(leftRightAngle + 180)*150 ;
  bkwdy = eyey;
  bkwdz = eyez + sin(leftRightAngle + 180)*150;

  mapx= int(bkwdx + 2000) / gridSize;
  mapy = int(bkwdz + 2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float rgtx, rgty, rgtz;
  int mapx, mapy;

  rgtx = eyex + cos(leftRightAngle + 90)*150 ;
  rgty = eyey;
  rgtz = eyez + sin(leftRightAngle + 90)*150;

  mapx= int(rgtx + 2000) / gridSize;
  mapy = int(rgtz + 2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float lftx, lfty, lftz;
  int mapx, mapy;

  lftx = eyex + cos(leftRightAngle - 90)*150 ;
  lfty = eyey;
  lftz = eyez + sin(leftRightAngle - 90)*150;

  mapx = int(lftx + 2000) / gridSize;
  mapy = int(lftz + 2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
