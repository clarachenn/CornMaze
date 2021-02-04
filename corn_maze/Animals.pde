
class Bunny extends GameObject {
  int timer;

  Bunny() {
    super();
    loc.x = -1850;
    loc.y = height - 30;
    loc.z = 1830;
    size = 30;
    timer = 0;

    vel = new PVector (random(1, 2), random(1, 2), random(1, 2));
    dir = new PVector (-1300 - loc.x, loc.y - loc.y, 1500 - loc.z);
    dir.setMag(0.1);
  }

  void show() {
    if (timer <= 0) {
      texturedCube(loc.x, height-30, loc.z, bunnysides, bunnysides, bunnytop, bunnyback, bunnyfront, bunnytop, 30);
    }
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Corn) {
          if (dist(loc.x, loc.y, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            timer++;
            obj.lives = 0;
            objects.add(new Carrot(loc));
          }
        }
        i++;
      }
      if (timer> 0 ) {
        loc.add(vel);
        vel.add(dir);
        texturedCube(loc.x, height-30, loc.z, bunnysides, bunnysides, bunnytop, bunnyback, bunnyfront2, bunnytop, 30);
      }
      if (loc.x >= 2000 || loc.x <= -2000 || loc.z >= 2000 || loc.z <= -2000) {
        lives = 0;
        timer = 0;
      } else {
        lives = 1;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Pig extends GameObject {

  float speed;
  int timer, bulletTimer, number1, number2;
  boolean pigBullet;

  Pig() {
    super();
    loc.x = random(-2000, 2000);
    loc.y = height - 40;
    loc.z = random(-2000, 2000);
    size = 40;
    vel = new PVector (random(0.01, 0.015), random(0.01, 0.015), random(0.01, 0.015));
    dir = new PVector (1150 - loc.x, loc.y - loc.y, 500 - loc.z);
    dir.setMag(0.01);
    timer = 0;
  }

  void show() {
    if (timer >= number1 && timer <= number2) {
      texturedCube(loc.x, height-40, loc.z, rpigfront, rpigback, rpigbottom, rpigsides, rpigbottom, 40);
    }
    if (timer < number1) {
      texturedCube(loc.x, height-40, loc.z, pigfront, pigback, pigbottom, pigsides, pigbottom, 40);
      pigBullet = false;
    }
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      loc.y = height-40;
      loc.add(vel);
      vel.add(dir);

      timer++;

      number1 = (int)random(300, 500);
      number2 = (int)random(700, 800);

      if (loc.x >= 2000 || loc.x <= -2000 || loc.z >= 2000 || loc.z <= -2000) {
        lives = 0;
        objects.add(new Pig());
      } else {
        lives = 1;
      }
      if (bulletTimer >= 10 && bulletTimer <= 20 && pigBullet) {
        objects.add(new pigBullet(loc));
        objects.add(new pigBullet(loc));
        objects.add(new pigBullet(loc));
        bulletTimer = 0;
        pigBullet = false;
        timer = 0 ;
        timer ++;
      }
      if (timer >= number2) {
        timer = 0;
        timer++;
      }
      if (timer >= number2 - 80 && timer <= number2) {
        bulletTimer++;
        pigBullet = true;
      }
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Corn) {
          if (dist(loc.x, loc.y, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
            objects.add(new Pig());
          }
        }
        if (obj instanceof Player) {
          if (dist(loc.x, loc.y, loc.z, eyex, eyey, eyez) <=  size + obj.size) {
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class PigWKey extends GameObject {

  float speed;
  int timer, bulletTimer, number1, number2;
  boolean pigBullet;

  PigWKey() {
    super();
    loc.x = random(-2000, 2000);
    loc.y = height - 40;
    loc.z = random(-2000, 2000);
    size = 40;
    vel = new PVector (random(0.01, 0.015), random(0.01, 0.015), random(0.01, 0.015));
    dir = new PVector (1150 - loc.x, loc.y - loc.y, 500 - loc.z);
    dir.setMag(0.01);
    timer = 0;
  }

  void show() {
    texturedCube(loc.x, height-40, loc.z, pigfrontkey, pigback, pigbottom, pigsides, pigbottom, 40);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      loc.y = height-40;
      loc.add(vel);
      vel.add(dir);
      timer++;

      number1 = (int)random(400, 600);
      number2 = (int)random(800, 900);

      if (loc.x >= 2000 || loc.x <= -2000 || loc.z >= 2000 || loc.z <= -2000) {
        lives = 0;
        objects.add(new PigWKey());
      } else {
        lives = 1;
      }
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Corn) {
          if (dist(loc.x, loc.y, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
            objects.add(new Key(loc));
          }
        }
        if (obj instanceof Player) {
          if (dist(loc.x, loc.y, loc.z, eyex, eyey, eyez) <=  size + obj.size) {
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Cow extends GameObject {
  
  int t1, t2, t3, t4, t5;

  Cow(float x, float z) {
    super();
    loc.x = x;
    loc.y = height - 60;
    loc.z = z;
    lives = 1;
    size = 60;
  }

  void show() {
    texturedCube(loc.x, height-60, loc.z, cowfront, cowback, cowtop, cowsides, cowtop, 60);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Corn) {
          if (dist(loc.x, loc.y, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            lives = 0;
            obj.lives = 0;
            objects.add(new Milk(loc));
          }
        }
        i++;
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Goat extends GameObject {

  Goat() {
    super();
    lives = 1;
    loc.x = random(-2000, 2000);
    loc.y = height - 70;
    loc.z = random(-2000, 2000);
    size = 70;
    vel = new PVector (random(0.03, 0.05), random(0.03, 0.05), random(0.03, 0.05));
    dir = new PVector (eyex - loc.x, eyey - loc.y, eyez - loc.z);
    dir.setMag(0.02);
  }

  void show() {
    texturedCube(loc.x, height-70, loc.z, goatfront, goatback, goattop, goatsides, goattop, 70);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    goatx = loc.x;
    goatz = loc.z;

    if (mode == GAME) {
      loc.add(vel);
      vel.add(dir);
      loc.y = height-70;

      if (loc.x >= 2000 || loc.x <= -2000 || loc.z >= 2000 || loc.z <= -2000) {
        lives = 0;
        objects.add(new Goat());
      }
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Corn) {
          if (dist(loc.x, loc.y, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            vel = new PVector (random(0.03, 0.05), random(0.03, 0.05), random(0.03, 0.05));
            dir = new PVector (random (-2000, 2000) - loc.x, loc.y, random(-2000, 2000) - loc.z);
            dir.setMag(0.02);
            loc.add(dir);
            vel.add(dir);
            obj.lives = 0;
          }
        }
        if (obj instanceof Player) {
          if (dist(loc.x, loc.y, loc.z, eyex, eyey, eyez) <=  size + obj.size && obj.canLoseLife) {
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


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Bee extends GameObject {
  
  Bee(float x, float y, float z) {
    super();
    loc.x = x;
    loc.y = y;
    loc.z = z;
    lives = 1;
    size = 10;
  }

  void show() {
    texturedCube(loc.x, loc.y, loc.z, beefront, beeback, beetop, beesides, beetop, 10);
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.popMatrix();
  }

  void act() {
    if (mode == GAME) {
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Corn) {
          if (dist(loc.x, loc.y, loc.z, obj.loc.x, obj.loc.y, obj.loc.z) <=  size + obj.size) {
            obj.lives = 0;
            objects.add(new Honey(loc));
          }
        }
        i++;
      }
    }
  }
}
