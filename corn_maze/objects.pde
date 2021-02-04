
class Key extends GameObject {

  Key(PVector newloc) {
    super();
    loc = newloc.copy();
    size = 10;
  }

  void show() {
    texturedCube(loc.x, height-10, loc.z, keysides, 10);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Hand) {
          if (dist(loc.x, height - 10, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
            obj.havekeys += 1;
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Rain extends GameObject {

  float speed, t;

  Rain() {
    super();
    loc.x = random(-2000, 2000);
    loc.y = 0;
    loc.z = random(-2000, 2000);
    size = random(1, 10);
    speed = random(size);
    t = 100;
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(rainblue, t);
    world.box(size);
    world.noStroke();
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      loc.y = loc.y + speed;
      if (loc.y >= height && t > 0) {
        loc.y = height;
        t -- ;
      } else if (loc.y >= height && t == 0) {
        loc.y = 0;
        loc.x = random(-2000, 2000);
        t = 100;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Milk extends GameObject {

  Milk(PVector newloc) {
    super();
    loc = newloc.copy();
    size = 20;
  }

  void show() {
    texturedCube(loc.x, height-20, loc.z, wmilk, 20);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Hand) {
          if (dist(loc.x, height - 20, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
            obj.havemilk += 1;
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class LifeBlock extends GameObject {

  LifeBlock() {
    lives = 1;
    size = 30;
    loc.x = random (-2000, 2000);
    loc.y = height - 30;
    loc.z = random (-2000, 2000);
  }

  void show() {
    texturedCube(loc.x, height-30, loc.z, freelife, 30);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      loc.y = height - 30;
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Player) {
          if (dist(loc.x, height - 30, loc.z, eyex, eyey, eyez) <=  size + obj.size && obj.lives <= 3) {
            obj.lives += 1;
            lives = 0;
            foundalife = true;
          } else if (dist(loc.x, height - 30, loc.z, eyex, eyey, eyez) <=  size + obj.size && obj.lives > 3) {
            fullhealth = true;
          }
        }
        if (obj instanceof Corn) {
          if (dist(loc.x, height - 30, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Carrot extends GameObject {

  Carrot(PVector newloc) {
    super();
    loc = newloc.copy();
    size = 15;
    loc.y = height-15;
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(orange);
    world.noStroke();
    world.scale(1, 2, 1);
    world.sphere(size);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Hand) {
          if (dist(loc.x, height - 15, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
            obj.havecarrot += 1;
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Flour extends GameObject {

  Flour() {
    super();
    loc.x = 420;
    loc.y = height - 20;
    loc.z = -350;
    size = 20;
  }

  void show() {
    texturedCube(loc.x, height-20, loc.z, floursides, floursides, flourtop, floursides, flourtop, 20);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Hand) {
          if (dist(loc.x, height - 20, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
            obj.haveflour += 1;
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Hay extends GameObject {

  Hay() {
    lives = 1;
    size = 40;
    loc.x = random (-1800, 1800);
    loc.y = height - 40;
    loc.z = random (-1800, 1800);
  }

  void show() {
    texturedCube(loc.x, height-40, loc.z, haysides, haysides, haytop, haysides, haytop, 40);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      loc.y = height - 40;
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Player) {
          if (dist(loc.x, loc.y, loc.z, eyex, eyey, eyez) <=  size + obj.size && obj.canLoseLife) {
            obj.canLoseLife = false;
            obj.lTimer = true;
            obj.lives -= 1;
            lives = 0;
            objects.add(new HaySticks(loc));
            objects.add(new HaySticks(loc));
            objects.add(new HaySticks(loc));
            objects.add(new HaySticks(loc));
          }
        }
        if (obj instanceof Corn) {
          if (dist(loc.x, loc.y, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
            objects.add(new HaySticks(loc));
            objects.add(new HaySticks(loc));
            objects.add(new HaySticks(loc));
            objects.add(new HaySticks(loc));
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Honey extends GameObject {

  Honey(PVector newloc) {
    super();
    loc = newloc.copy();
    loc.y = height - 10;
    size = 10;
    lives = 1;
  }

  void show() {
    texturedCube(loc.x, height-10, loc.z, honeycomb, 10);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Hand) {
          if (dist(loc.x, height - 10, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
            obj.havehoney += 1;
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class HaySticks extends GameObject {

  HaySticks(PVector newloc) {
    super();
    lives = 255;
    loc = newloc.copy();
    speed = 50;
    size = 10;
    float vx = random(-3, 3);
    float vy = random(-3, 3);
    float vz = random(-3, 3);
    vel = new PVector (vx, vy, vz);
    vel.setMag(speed);
    gravity = new PVector(0, 3, 0);
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.noStroke();
    world.fill(cornyellow, lives);
    world.scale(3, 1);
    world.box(size);
    world.popMatrix();
    lives--;
  }

  void act() {
    if (mode == GAME) {
      if (loc.y >= height - size) {
        loc.y = height - size;
      } else {
        vel.add(gravity);
        loc.add(vel);
      }
    }
  }
}
