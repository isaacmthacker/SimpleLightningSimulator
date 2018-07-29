class Rain {
  ArrayList<RainDrop> rain;
  float cutoff;
  float cloudHeight;
  int maxNumRain = 300;
  int maxPerCycle = 5;
  ArrayList<RainDrop> toRemove;
  Rain(float gh, float ch) {
    rain = new ArrayList<RainDrop>();
    toRemove = new ArrayList<RainDrop>();
    cutoff = height-gh;
    cloudHeight = ch;
    for (int i = 0; i < maxNumRain; ++i) {
      addRainDrop();
    }
  }

  void addRainDrop() {
    rain.add(new RainDrop(new Point(random(0, width), random(-10*cloudHeight, cloudHeight))));
  }
  void run() {
    for (RainDrop r : rain) {
      if (r.p.y >= cutoff) {
        toRemove.add(r);
      } else {
        r.run();
      }
    }
    for (RainDrop r : toRemove) {
      rain.remove(r);
    }
    if (rain.size() <= maxNumRain) {
      for (int i = 0; i < maxPerCycle; ++i) {
        addRainDrop();
      }
    }
  }
}