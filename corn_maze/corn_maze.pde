
import java.awt.Robot;

//color pallette
color black = #000000; //short corn
color white = #FFFFFF; //empty space
color dullBlue = #7092BE; //tall corn
color rainblue = #B2E1FF; //rain
color pink = #FAB6B8; //pig bullet
color meat = #FA92C8; //pig food
color tan = #F7D6B8; //cows sign
color orange = #FFA468; //carrot
color corngreen = #8BD864; //corn bullets
color cornyellow = #FFFD54; //corn particles
color cornorange = #F6DD10; //corn stroke
color pigpink = #FFA4A4; //pigssign
color honeyyellow = #fff600; //honey
color carrotorange = #ff8a00; // carrot corn

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int YOUWON = 3;
final int YOULOST = 4;
final int INSTRUCTIONS = 5;

int mode2;
final int IMMUNE = 0;
final int NOTIMMUNE = 1;

int playerlives;
final int ONEL = 1;
final int TWOL = 2;
final int THREEL = 3;
final int FOURL = 4;

//textures
PImage cornb, corna, dirt, rpigfront, rpigbottom, rpigback, rpigsides, pigfront, pigback, pigsides, pigbottom, cornbcarrot;
PImage pigfoodtop, pigfoodsides, pigfrontkey, keysides, keytop, cowfront, cowsides, cowtop, cowback, wmilk, cowsign;
PImage bunnyfront, bunnyback, bunnytop, bunnysides, bunnyfront2, flourtop, floursides, pigssign, pigssigntop, goatsides;
PImage goatfront, goattop, goatback, haytop, haysides, freelife, beefront, beesides, beetop, beeback, honeycomb, clouds;

//map variables
int gridSize;
PImage map;

//robot for mouse control
Robot rbt;

//camera variables
float eyex, eyey, eyez; //camera position
float focusx, focusy, focusz; //point at which camera faces
float upx, upy, upz; //tilt axis

//keyboard variabes
boolean wkey, akey, skey, dkey, qkey, spacekey;

boolean keys, milk, carrot, flour, honey, fullhealth, foundalife;

float goatx, goatz;

//rotation variables
float leftRightAngle, upDownAngle;

//Game Objects
ArrayList<GameObject> objects;

//canvases
PGraphics world;
PGraphics HUD;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void setup() {
  //create canvases
  world = createGraphics(width, height, P3D);
  HUD   = createGraphics(width, height, P2D);

  //create game object lists
  objects = new ArrayList<GameObject>();

  mode = INTRO;
  mode2 = NOTIMMUNE;

  int i = 0;
  while (i < 300) {
    objects.add(new Rain());
    objects.add(new Rain());
    objects.add(new Rain());
    i++;
  }
  objects.add(new Bunny());
  objects.add(new Bee(-1800, height - 150, -1800));
  objects.add(new Bee(-1750, height - 130, -1750));
  objects.add(new Bee(-1700, height - 150, -1850));
  objects.add(new Bee(-1775, height - 170, -1700));
  objects.add(new Bee(-1800, height - 140, -1725));
  objects.add(new Bee(-1850, height - 130, -1800));
  objects.add(new Cow(870, 640));
  objects.add(new Cow(800, 700));
  objects.add(new Cow(900, 780));
  objects.add(new Cow(790, 620));
  objects.add(new Hay());
  objects.add(new Hay());
  objects.add(new Hay());
  objects.add(new Player());
  objects.add(new Pig());
  objects.add(new Pig());
  objects.add(new Pig());
  objects.add(new Goat());
  objects.add(new PigWKey());
  objects.add(new PigWKey());
  objects.add(new Flour());
  objects.add(new LifeBlock());

  //load textures
  cornb = loadImage("cornb.png");
  dirt = loadImage("dirt.png");
  corna = loadImage("corna.png");
  cornbcarrot = loadImage("cornbcarrot.png");
  rpigfront = loadImage("rpigfront.png");
  rpigback = loadImage("rpigback.png");
  rpigsides = loadImage("rpigsides.png");
  rpigbottom = loadImage("rpigbottom.png");
  pigfront = loadImage("pigfront.png");
  pigback = loadImage("pigback.png");
  pigsides = loadImage("pigsides.png");
  pigbottom = loadImage("pigbottom.png");
  pigfoodtop = loadImage("pigfoodtop.png");
  pigfoodsides = loadImage("pigfoodsides.png");
  pigfrontkey = loadImage("pigfrontkey.png");
  keysides = loadImage("keysides.png");
  keytop = loadImage("keytop.png");
  cowfront = loadImage("cowfront.png");
  cowsides = loadImage("cowsides.png");
  cowback = loadImage("cowback.png");
  cowtop = loadImage("cowtop.png");
  wmilk = loadImage("milk.png");
  cowsign = loadImage("cowsign.png");
  bunnyfront = loadImage("bunnyfront.png");
  bunnytop = loadImage("bunnytop.png");
  bunnysides = loadImage("bunnysides.png");
  bunnyback = loadImage("bunnyback.png");
  bunnyfront2 = loadImage("bunnyfront2.png");
  flourtop = loadImage("flourtop.png");
  floursides = loadImage("floursides.png");
  pigssign = loadImage("pigssign.png");
  pigssigntop = loadImage("pigssigntop.png");
  goattop = loadImage("goattop.png");
  goatsides = loadImage("goatsides.png");
  goatfront = loadImage("goatfront.png");
  goatback = loadImage("goatback.png");
  haytop = loadImage("haytop.png");
  haysides = loadImage("haysides.png");
  freelife = loadImage("freelife.png");
  beefront = loadImage("beefront.png");
  beesides = loadImage("beesides.png");
  beetop = loadImage("beetop.png");
  beeback = loadImage("beeback.png");
  honeycomb = loadImage("honeycomb.png");
  clouds = loadImage("clouds.png");

  wkey = false;
  akey = false;
  skey = false;
  dkey = false;
  spacekey = false;
  qkey = false;
  keys = false;
  milk = false;
  carrot = false;
  honey = false;
  flour = false;
  fullhealth = false;
  foundalife = false;

  //initializes map
  map = loadImage("map.png");
  gridSize = 100;

  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }

  size(displayWidth, displayHeight, P2D);
  eyex = width/2;
  eyey = 9*height/10;
  eyez = height/2;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;

  upx = 0;
  upy = 1;
  upz = 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void draw() {

  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(#DDE9F9);

  //world.pointLight(255, 255, 255, eyex, eyey, eyez);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz) ;

  move();
  drawFloor(-2000, 2000, height, gridSize);            //floor
  drawFloor(-2000, 2000, height-gridSize*4, gridSize); //ceiling
  drawMap();

  int i = 0;

  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }

  world.endDraw();
  image(world, 0, 0);

  HUD.beginDraw();
  HUD.clear();
  drawCrosshair();
  drawMinimap();

  HUD.endDraw();
  image(HUD, 0, 0);

  if (mode == INTRO) {
    intro();
  } else if (mode == INSTRUCTIONS) {
    instructions();
  } else if (mode == GAME) {
    game();
    if (mode2 == IMMUNE) {
      immune();
    } else if (mode2 == NOTIMMUNE) {
      notimmune();
    }
    if (playerlives == ONEL) {
      onelife();
    }
    if (playerlives == TWOL) {
      twolives();
    }
    if (playerlives == THREEL) {
      threelives();
    }
    if (playerlives == FOURL) {
      fourlives();
    }
    if (fullhealth) {
      fullhealth();
    }
    if (foundalife) {
      foundalife();
    }
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == YOUWON) {
    youwon();
  } else if (mode == YOULOST) {
    youlost();
  } else {
    println("Error: Mode = " + mode);
  }
}
