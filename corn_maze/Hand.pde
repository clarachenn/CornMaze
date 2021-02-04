
class Hand extends GameObject {

  float speed;

  Hand() {
    super (eyex, eyey, eyez, 10);
    speed = 50;
    float vx = cos(leftRightAngle);
    float vy = tan(upDownAngle);
    float vz = sin(leftRightAngle);
    dir = new PVector (vx, vy, vz);
    dir.setMag(speed);
    lives = 1;
    havehoney = 0;
    havekeys = 0;
    havemilk = 0;
    havecarrot = 0;
    haveflour = 0;
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.noFill();
    world.noStroke();
    world.sphere(4);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int hitx = int(loc.x + 2000) / gridSize;
      int hity = int(loc.z + 2000) / gridSize;
      if (map.get(hitx, hity) == white) {
        loc.add(dir);
      }
      if (havemilk >= 1) {
        milk = true;
      }
      if (haveflour >= 1) {
        flour = true;
      }
      if (havecarrot >= 1) {
        carrot = true;
      }
      if (havekeys >= 1) {
        keys = true;
      }
      if (havehoney >= 1) {
        honey = true;
      }
      if (milk && keys && carrot && flour && honey) {
        mode = YOUWON;
        youwon();
      }
    }
  }
}
