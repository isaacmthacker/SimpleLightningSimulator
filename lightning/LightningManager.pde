class LightningManager {
  int numLightnings;
  int maxNumLightnings = 5;
  float probToAdd = random(0, 0.1);
  ArrayList<Lightning> lightnings = new ArrayList<Lightning>();
  float endy;
  LightningManager(float y) {
    numLightnings = 1;
    endy = y;
    addLightning();
  }


  void run() {
    //if (lightnings.size() == 0) {
    //  addLightning();
    //}
    ArrayList<Lightning> toremove = new ArrayList<Lightning>();
    for (Lightning lightning : lightnings) {
      boolean delete = lightning.run();
      if (delete) {
        toremove.add(lightning);
      }
    }
    for (Lightning l : toremove) {
      lightnings.remove(l);
      --numLightnings;
    }
    if (numLightnings < maxNumLightnings) {
      if (random(0, 1.0) <= probToAdd) {
        ++numLightnings;
        addLightning();
      }
    }
  }

  void addLightning() {
    lightnings.add(new Lightning(random(20, width-20), random(0, 25), endy));
  }
}