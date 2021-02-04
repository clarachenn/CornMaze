
class Corn extends GameObject {

  float speed;

  Corn() {
    super (eyex, eyey, eyez, 10);
    speed = 50;
    float vx = cos(leftRightAngle);
    float vy = tan(upDownAngle);
    float vz = sin(leftRightAngle);
    dir = new PVector (vx, vy, vz);
    dir.setMag(speed);
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(corngreen);
    world.noStroke();
    world.scale(2, 1, 2);
    world.sphere(3);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int hitx = int(loc.x + 2000) / gridSize;
      int hity = int(loc.z + 2000) / gridSize;
      if (map.get(hitx, hity) == white) {
        loc.add(dir);
      } else {
        lives = 0;
        for (int i = 0; i < 10; i++) {
          objects.add(new Particle(loc));
        }
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Particle extends GameObject {

  Particle(PVector newloc) {
    super();
    lives = 255;
    loc = newloc.copy();
    speed = 50;
    float vx = random(-5, 5);
    float vy = random(-5, 0);
    float vz = random(-5, 5);
    vel = new PVector (vx, vy, vz);
    vel.setMag(speed);
    gravity = new PVector(0, 5, 0);
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(cornyellow);
    world.strokeWeight(3);
    world.stroke(cornorange);
    world.box(size);
    world.popMatrix();
    lives--;
  }

  void act() {
    if (mode == GAME) {
      if (loc.y >= height) {
        loc.y = height;
      } else {
        vel.add(gravity);
        loc.add(vel);
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class pigBullet extends GameObject {

  int t;

  pigBullet (PVector nloc) {
    super();
    t = 255;
    loc = nloc.copy();
    speed = 60;
    float vx = random(-5, 5);
    float vy = random(-5, 0);
    float vz = random(-5, 5);
    vel = new PVector (vx, vy, vz);
    vel.setMag(speed);
    gravity = new PVector(0, 5, 0);
    size = 10;
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(pink, t);
    world.noStroke();
    world.sphere(size);
    world.popMatrix();
    t--;
  }

  void act() {
    if (mode == GAME) {
      vel.add(gravity);
      loc.add(vel);
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Player) {
          if (dist(loc.x, loc.y, loc.z, eyex, eyey, eyez) <= size + obj.size && obj.canLoseLife) {
            lives = 0;
            obj.canLoseLife = false;
            obj.lTimer = true;
            obj.lives -= 1;
          }
        }
        i++;
      }
    }
  }
}
