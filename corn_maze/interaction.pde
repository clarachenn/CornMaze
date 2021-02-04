
void keyPressed() {
  if (mode == GAME) {
    gameKeyPressed();
  }
}

void keyReleased() {
  if (mode == GAME) {
    gameKeyReleased();
  }
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == INSTRUCTIONS) {
    instructionClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == YOUWON) {
    youwonClicks();
  } else if (mode == YOULOST) {
    youlostClicks();
  }
}
