
void drawCrosshair() {
  if (mode == GAME) {
    HUD.stroke(white);
    HUD.strokeWeight(5);
    HUD.line(width/2-20, height/2, width/2+20, height/2);
    HUD.line(width/2, height/2-20, width/2, height/2+20);
  }
}

void drawMinimap() {
  if (mode == GAME) {
    HUD.image(map, 50, 50, 160, 160); //x4

    int miniX = int(eyex+2000)/gridSize;
    int miniY = int(eyez+2000)/gridSize;
    int goatX = int(goatx +2000)/ gridSize;
    int goatY = int(goatz +2000)/ gridSize;

    HUD.textSize(20);
    HUD.fill(255, 0, 0);
    HUD.text("X: " + miniX, 50, 250);
    HUD.text("Y: " + miniY, 50, 290);

    HUD.strokeWeight(1);
    HUD.stroke(255, 0, 0);
    HUD.fill(255, 0, 0);
    HUD.rect(miniX*4+50, miniY*4+50, 4, 4); //indicator of where you are

    HUD.strokeWeight(1);
    HUD.stroke(#c18536);
    HUD.fill(#c18536);
    HUD.rect(goatX*4+50, goatY*4+50, 4, 4); //where the goat is
  }
}
