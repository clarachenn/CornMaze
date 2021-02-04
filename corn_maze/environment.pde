
void drawMap() {
  if (mode == GAME) {
    for (int x = 0; x < map.width; x++) {
      for (int y = 0; y < map.height; y++) {
        color c = map.get(x, y);

        if (c == black) {
          texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, corna, gridSize);
          texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, cornb, gridSize);
        }
        if (c == dullBlue) {
          texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, corna, gridSize);
          texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, corna, gridSize);
          texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, cornb, gridSize);
        }
        if (c == meat) {
          texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, pigfoodtop, pigfoodsides, pigfoodtop, gridSize);
        }
        if (c == tan) {
          texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, corna, corna, corna, cowsign, corna, corna, gridSize);
          texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, cornb, gridSize);
        }
        if (c == pigpink) {
          texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, pigssigntop, pigssign, pigssigntop, gridSize);
          texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, pigssigntop, pigssigntop, pigssigntop, gridSize);
        }
        if (c == honeyyellow) {
          texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, corna, gridSize);
          texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, honeycomb, gridSize);
          texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, cornb, gridSize);
        }
        if (c == carrotorange) {
          texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, corna, gridSize);
          texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, corna, gridSize);
          texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, cornbcarrot, gridSize);
        }
      }
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void drawFloor(int start, int end, int level, int gap) {
  if (mode == GAME) {
    world.stroke(255);
    world.strokeWeight(1);
    int x = start;
    int z = start;
    while (z < end && level == height) {
      texturedCube(x, level, z, dirt, gap);
      x = x + gap;
      if (x >= end) {
        x = start;
        z = z + gap;
      }
    }
    while (z < end && level == height-gridSize*4) {
      texturedCube(x, level, z, clouds, gap);
      x = x + gap;
      if (x >= end) {
        x = start;
        z = z + gap;
      }
    }
  }
}
