
class GameObject {

  PVector loc, vel, gravity, dir;
  float size, lives, speed;
  boolean canLoseLife, lTimer;
  int havekeys, havemilk, havecarrot, haveflour, havehoney;

  //default
  GameObject() {
    loc = new PVector (0, 0, 0);
    size = 10;
    lives = 1;
  }

  GameObject(float x, float y, float z, float s) {
    lives = 1;
    loc = new PVector (x, y, z);
    size = s;
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white);
    world.stroke(100);
    world.box(size);
    world.popMatrix();
  }

  void act() {
    if (mode == YOUWON) {
      lives = 0;
    }
    if (mode == YOULOST) {
      lives = 0;
    }
  }
}
