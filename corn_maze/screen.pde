
void notimmune() {
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void onelife() {
  fill(255, 0, 0);
  textSize(20);
  text("lives: 1", 50, 330);
}

void twolives() {
  fill(255, 0, 0);
  textSize(20);
  text("lives: 2", 50, 330);
}

void threelives() {
  fill(255, 0, 0);
  textSize(20);
  text("lives: 3", 50, 330);
}

void fourlives() {
  fill(255, 0, 0);
  textSize(20);
  text("lives: 4", 50, 330);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void immune() {

  fill(255, 0, 0);
  textSize(40);
  text("you lost a life", 580, 180);

  fill(255);
  textSize(60);
  text("immune", 600, 680);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void fullhealth() {
  fill(255, 0, 0);
  textSize(40);
  text("you have full health", 520, 240);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void foundalife() {
  fill(255, 0, 0);
  textSize(40);
  text("you found a life", 565, 240);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void instructions() {
  background(74, 213, 73);

  fill(255);
  textSize(80);
  text("instructions", 495, 100);

  fill(255);
  textSize(30);
  text("- walk around the maze and give animals corn (space bar) to receive items in return.", 50, 170);
  text("- you will need", 50, 270);
  text("- use 'w' 'a' 's' and 'd' to walk around, use 'q' to collect items, and use 'p' to pause the game.", 50, 320);
  text("- look closely: there are good and bad pigs (some pigs get angry and throw bullets).", 50, 420);
  text("- hay blocks spawn randomly. don't trip over them! knock them over with corn.", 50, 520);
  text("- life blocks will give you an extra life.", 50, 620);
  text("- warning: don't stay at one place for too long or else goats will catch up to you.", 50, 670);
  text("(they get angry if you dont give them corn). good luck!", 70, 720);
  text("begin", 1300, 750);
  fill(cornyellow);
  textSize(30);
  text("carrots, milk, flour, honey, and a key", 280, 270); //240

  fill(orange);
  noStroke();
  ellipse(330, 210, 25, 55);
  fill(pink);
  ellipse(1205, 360, 40, 40);
  image(wmilk, 411, 190, 40, 40);
  image(floursides, 497, 190, 40, 40);
  image(honeycomb, 593, 190, 40, 40);
  image(keysides, 769, 190, 40, 40);
  image(pigfrontkey, 423, 340, 40, 40);
  image(pigfront, 560, 340, 40, 40);
  image(pigfront, 560, 340, 40, 40);
  image(rpigfront, 930, 340, 40, 40);
  image(haytop, 84, 440, 40, 40);
  image(freelife, 80, 540, 40, 40);
  image(goatfront, 855, 590, 40, 40);
}

void instructionClicks() {
  mode = GAME;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void pause() {
  background(0);

  image(corna, 0, 0, 200, 200);
  image(corna, 0, 200, 200, 200);
  image(corna, 0, 400, 200, 200);
  image(cornb, 0, 600, 200, 200);

  image(corna, 200, 0, 200, 200);
  image(corna, 200, 200, 200, 200);
  image(corna, 200, 400, 200, 200);
  image(cornb, 200, 600, 200, 200);

  image(corna, 400, 0, 200, 200);
  image(corna, 400, 200, 200, 200);
  image(corna, 400, 400, 200, 200);
  image(cornb, 400, 600, 200, 200);

  image(corna, 600, 0, 200, 200);
  image(corna, 600, 200, 200, 200);
  image(corna, 600, 400, 200, 200);
  image(cornb, 600, 600, 200, 200);

  image(corna, 800, 0, 200, 200);
  image(corna, 800, 200, 200, 200);
  image(corna, 800, 400, 200, 200);
  image(cornb, 800, 600, 200, 200);

  image(corna, 1000, 0, 200, 200);
  image(corna, 1000, 200, 200, 200);
  image(corna, 1000, 400, 200, 200);
  image(cornb, 1000, 600, 200, 200);

  image(corna, 1200, 0, 200, 200);
  image(corna, 1200, 200, 200, 200);
  image(corna, 1200, 400, 200, 200);
  image(cornb, 1200, 600, 200, 200);

  image(corna, 1400, 0, 200, 200);
  image(corna, 1400, 200, 200, 200);
  image(corna, 1400, 400, 200, 200);
  image(cornb, 1400, 600, 200, 200);

  image(cowfront, 0, 500, 300, 300);
  image(pigfrontkey, 270, 600, 200, 200);
  image(goatfront, 1100, 450, 350, 350);
  image(bunnyfront, 980, 650, 150, 150);

  noStroke();
  fill (181, 197, 223);
  rect(0, 150, 1700, 130);

  textSize(100);
  fill(74, 213, 73);
  text("paused", 520, 245);

  textSize(100);
  fill(254, 255, 9);
  text("paused", 515, 250);

  fill(255);
  textSize(40);
  text("continue", 615, 755);
}

void pauseClicks() {
  mode = GAME;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void game() {
}

void  gameKeyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 'q' || key == 'Q') qkey = true;
  if (key == ' ') spacekey = true;
  if (key == 'p' || key == 'P') mode = PAUSE;
}

void  gameKeyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 'q' || key == 'Q') qkey = false;
  if (key == ' ') spacekey = false;
}

void gameClicks() {
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void youlost() {
  background(181, 197, 223);

  image(goatfront, 0, 0, 120, 120);
  image(cowfront, 120, 0, 120, 120);
  image(pigfront, 240, 0, 120, 120);
  image(bunnyfront, 360, 0, 120, 120);
  image(goatfront, 480, 0, 120, 120);
  image(cowfront, 600, 0, 120, 120);
  image(pigfront, 720, 0, 120, 120);
  image(bunnyfront, 840, 0, 120, 120);
  image(goatfront, 960, 0, 120, 120);
  image(cowfront, 1080, 0, 120, 120);
  image(pigfront, 1200, 0, 120, 120);
  image(bunnyfront, 1320, 0, 120, 120);

  image(cowfront, 0, 120, 120, 120);
  image(pigfront, 120, 120, 120, 120);
  image(bunnyfront, 240, 120, 120, 120);
  image(goatfront, 360, 120, 120, 120);

  image(cowfront, 960, 120, 120, 120);
  image(pigfront, 1080, 120, 120, 120);
  image(bunnyfront, 1200, 120, 120, 120);
  image(goatfront, 1320, 120, 120, 120);

  image(bunnyfront, 0, 360, 120, 120);
  image(goatfront, 120, 360, 120, 120);
  image(cowfront, 240, 360, 120, 120);

  image(goatfront, 1080, 360, 120, 120);
  image(cowfront, 1200, 360, 120, 120);
  image(pigfront, 1320, 360, 120, 120);

  image(pigfront, 0, 240, 120, 120);
  image(bunnyfront, 120, 240, 120, 120);
  image(goatfront, 240, 240, 120, 120);
  image(cowfront, 360, 240, 120, 120);
  image(pigfront, 480, 240, 120, 120);
  image(bunnyfront, 600, 240, 120, 120);
  image(goatfront, 720, 240, 120, 120);
  image(cowfront, 840, 240, 120, 120);
  image(pigfront, 960, 240, 120, 120);
  image(bunnyfront, 1080, 240, 120, 120);
  image(goatfront, 1200, 240, 120, 120);
  image(cowfront, 1320, 240, 120, 120);
  image(pigfront, 1440, 240, 120, 120);

  image(goatfront, 0, 480, 120, 120);
  image(cowfront, 120, 480, 120, 120);
  image(pigfront, 240, 480, 120, 120);
  image(bunnyfront, 360, 480, 120, 120);
  image(goatfront, 480, 480, 120, 120);
  image(cowfront, 600, 480, 120, 120);
  image(pigfront, 720, 480, 120, 120);
  image(bunnyfront, 840, 480, 120, 120);
  image(goatfront, 960, 480, 120, 120);
  image(cowfront, 1080, 480, 120, 120);
  image(pigfront, 1200, 480, 120, 120);
  image(bunnyfront, 1320, 480, 120, 120);
  image(goatfront, 1440, 480, 120, 120);

  image(pigfront, 0, 680, 120, 120);
  image(bunnyfront, 120, 680, 120, 120);
  image(goatfront, 240, 680, 120, 120);
  image(cowfront, 360, 680, 120, 120);
  image(pigfront, 480, 680, 120, 120);
  image(bunnyfront, 600, 680, 120, 120);
  image(goatfront, 720, 680, 120, 120);
  image(cowfront, 840, 680, 120, 120);
  image(pigfront, 960, 680, 120, 120);
  image(bunnyfront, 1080, 680, 120, 120);
  image(goatfront, 1200, 680, 120, 120);
  image(cowfront, 1320, 680, 120, 120);
  image(pigfront, 1440, 680, 120, 120);

  fill(255);
  textSize(60);
  text("oof, you lost!", 532, 205);
  textSize(50);
  text("try harder next time", 474, 440);
  fill(255);
  textSize(50);
  text("play again", 593, 655);
}
void youlostClicks() {
  objects = new ArrayList<GameObject>();
  setup();

  mode = INTRO;
  intro();
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void youwon() {
  background(181, 197, 223);

  image(floursides, 0, 0, 120, 120);
  image(keysides, 120, 0, 120, 120);
  image(honeycomb, 240, 0, 120, 120);
  image(wmilk, 360, 0, 120, 120);
  image(floursides, 480, 0, 120, 120);
  image(keysides, 600, 0, 120, 120);
  image(honeycomb, 720, 0, 120, 120);
  image(wmilk, 840, 0, 120, 120);
  image(floursides, 960, 0, 120, 120);
  image(keysides, 1080, 0, 120, 120);
  image(honeycomb, 1200, 0, 120, 120);
  image(wmilk, 1320, 0, 120, 120);

  image(keysides, 0, 120, 120, 120);
  image(honeycomb, 120, 120, 120, 120);
  image(wmilk, 240, 120, 120, 120);
  image(floursides, 360, 120, 120, 120);

  image(keysides, 960, 120, 120, 120);
  image(honeycomb, 1080, 120, 120, 120);
  image(wmilk, 1200, 120, 120, 120);
  image(floursides, 1320, 120, 120, 120);

  image(wmilk, 0, 360, 120, 120);
  image(floursides, 120, 360, 120, 120);
  image(keysides, 240, 360, 120, 120);

  image(floursides, 1080, 360, 120, 120);
  image(keysides, 1200, 360, 120, 120);
  image(honeycomb, 1320, 360, 120, 120);

  image(honeycomb, 0, 240, 120, 120);
  image(wmilk, 120, 240, 120, 120);
  image(floursides, 240, 240, 120, 120);
  image(keysides, 360, 240, 120, 120);
  image(honeycomb, 480, 240, 120, 120);
  image(wmilk, 600, 240, 120, 120);
  image(floursides, 720, 240, 120, 120);
  image(keysides, 840, 240, 120, 120);
  image(honeycomb, 960, 240, 120, 120);
  image(wmilk, 1080, 240, 120, 120);
  image(floursides, 1200, 240, 120, 120);
  image(keysides, 1320, 240, 120, 120);
  image(honeycomb, 1440, 240, 120, 120);

  image(floursides, 0, 480, 120, 120);
  image(keysides, 120, 480, 120, 120);
  image(honeycomb, 240, 480, 120, 120);
  image(wmilk, 360, 480, 120, 120);
  image(floursides, 480, 480, 120, 120);
  image(keysides, 600, 480, 120, 120);
  image(honeycomb, 720, 480, 120, 120);
  image(wmilk, 840, 480, 120, 120);
  image(floursides, 960, 480, 120, 120);
  image(keysides, 1080, 480, 120, 120);
  image(honeycomb, 1200, 480, 120, 120);
  image(wmilk, 1320, 480, 120, 120);
  image(floursides, 1440, 480, 120, 120);

  image(honeycomb, 0, 680, 120, 120);
  image(wmilk, 120, 680, 120, 120);
  image(floursides, 240, 680, 120, 120);
  image(keysides, 360, 680, 120, 120);
  image(honeycomb, 480, 680, 120, 120);
  image(wmilk, 600, 680, 120, 120);
  image(floursides, 720, 680, 120, 120);
  image(keysides, 840, 680, 120, 120);
  image(honeycomb, 960, 680, 120, 120);
  image(wmilk, 1080, 680, 120, 120);
  image(floursides, 1200, 680, 120, 120);
  image(keysides, 1320, 680, 120, 120);
  image(honeycomb, 1440, 680, 120, 120);

  fill(255);
  textSize(80);
  text("congrats!", 535, 205);
  textSize(50);
  text("you found everything", 460, 420);
  textSize(20);
  text("now go make a carrot cake", 590, 455);

  fill(255);
  textSize(50);
  text("play again", 593, 655);
}

void youwonClicks() {
  objects = new ArrayList<GameObject>();
  setup();

  mode = INTRO;
  intro();
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void intro() {
  background(0);

  image(corna, 0, 0, 200, 200);
  image(corna, 0, 200, 200, 200);
  image(corna, 0, 400, 200, 200);
  image(cornb, 0, 600, 200, 200);

  image(corna, 200, 0, 200, 200);
  image(corna, 200, 200, 200, 200);
  image(corna, 200, 400, 200, 200);
  image(cornb, 200, 600, 200, 200);

  image(corna, 400, 0, 200, 200);
  image(corna, 400, 200, 200, 200);
  image(corna, 400, 400, 200, 200);
  image(cornb, 400, 600, 200, 200);

  image(corna, 600, 0, 200, 200);
  image(corna, 600, 200, 200, 200);
  image(corna, 600, 400, 200, 200);
  image(cornb, 600, 600, 200, 200);

  image(corna, 800, 0, 200, 200);
  image(corna, 800, 200, 200, 200);
  image(corna, 800, 400, 200, 200);
  image(cornb, 800, 600, 200, 200);

  image(corna, 1000, 0, 200, 200);
  image(corna, 1000, 200, 200, 200);
  image(corna, 1000, 400, 200, 200);
  image(cornb, 1000, 600, 200, 200);

  image(corna, 1200, 0, 200, 200);
  image(corna, 1200, 200, 200, 200);
  image(corna, 1200, 400, 200, 200);
  image(cornb, 1200, 600, 200, 200);

  image(corna, 1400, 0, 200, 200);
  image(corna, 1400, 200, 200, 200);
  image(corna, 1400, 400, 200, 200);
  image(cornb, 1400, 600, 200, 200);

  image(cowfront, 0, 500, 300, 300);
  image(pigfrontkey, 270, 600, 200, 200);
  image(goatfront, 1100, 450, 350, 350);
  image(bunnyfront, 980, 650, 150, 150);

  noStroke();
  fill (181, 197, 223);
  rect(0, 150, 1700, 130);

  textSize(100);
  fill(74, 213, 73);
  text("corn maze", 450, 245);

  textSize(100);
  fill(254, 255, 9);
  text("corn maze", 445, 250);

  fill(255);
  textSize(40);
  text("play", 660, 755);
}

void introClicks() {
  mode = INSTRUCTIONS;
}
