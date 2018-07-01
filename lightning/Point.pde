class Point {
  float x, y;
  Point root;
  Point parent;
  boolean isleaf;
  float stroke = 1.0;
  float cloudSize; //only used in Cloud
  Point(float xx, float yy) {
    x = xx;
    y = yy;
    root = null;
    parent = null;
    isleaf = false;
  }
}