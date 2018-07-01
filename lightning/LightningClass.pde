class Lightning {
  ArrayList<Point> points;
  ArrayList<Point> leaves;
  float startx, starty;
  float probSplit = random(0, 0.1);
  float ycutOff;
  float minLen = 3.0;
  float maxLen = 10.0;
  float angleMin = PI/4.0;
  float angleMax = 3.0*PI/4.0;
  int stroke = 1;
  boolean delete = false;
  int maxBranches = 5;
  int numBranches;
  int endRunsBright = 1;
  int runsBright = 0;
  int distToSplit = 20;
  int distSinceLastSplit = distToSplit;
  color c = color(255, 255, 0);//color(255, 0, 255);
  color brightColor = color(255);
  int brightWeight = 5;
  float startingStroke = 3.0;
  Lightning(float xx, float yy, float endy) {
    startx = xx;
    starty = yy;
    ycutOff = endy;
    points = new ArrayList<Point>();
    leaves = new ArrayList<Point>();
    Point startingPoint = new Point(startx, starty);
    startingPoint.stroke = startingStroke;
    points.add(startingPoint);
    leaves.add(points.get(0));
    numBranches = 1;
  }
  void display() {
    stroke(c);
    strokeWeight(stroke);
    fill(c);
    if (delete) {
      stroke(brightColor);
      fill(brightColor);
    } else {
      stroke(c);
      fill(c);
    }
    for (Point p : points) {
      if (p.parent != null) {
        if (delete) {
          strokeWeight(p.parent.stroke*2.0);
        } else {
          strokeWeight(p.parent.stroke);
        }
        line(p.parent.x, p.parent.y, p.x, p.y);
        if (delete && p.y >= ycutOff) {
          noStroke();
          ellipse(p.x, p.y, 50, 10);
        }
        if (runsBright == endRunsBright) {
          rect(0, 0, width, height);
        }
      }
    }
  }

  Point getPoint(float angle, Point parent) {
    parent.isleaf = false;
    float len = random(minLen, maxLen);
    Point ret = new Point(len*cos(angle) + parent.x, len*sin(angle) + parent.y);
    ret.parent = parent;
    return ret;
  }

  Point getPoint(Point parent) {
    float angle = random(angleMin, angleMax);
    return getPoint(angle, parent);
  }


  void addPoint() {
    ArrayList<Point> newLeaves =new ArrayList<Point>();
    for (Point p : leaves) {
      int numToAdd = 1;
      if (numBranches < maxBranches) {
        if (random(0, 1.0) <= probSplit) {
          numToAdd = 2;
          ++numBranches;
        }
      }
      ArrayList<Point> newPoints = new ArrayList<Point>();
      if (numToAdd == 1) {
        newPoints.add(getPoint(p));
        newPoints.get(0).stroke = newPoints.get(0).parent.stroke;
      } else {
        newPoints.add(getPoint(angleMin, p));
        newPoints.get(0).stroke = newPoints.get(0).parent.stroke;
        newPoints.add(getPoint(angleMax, p));
        newPoints.get(1).stroke = newPoints.get(1).parent.stroke/2.0;
      }
      for (Point newP : newPoints) {
        newLeaves.add(newP);
        points.add(newP);
        if (newP.y >= ycutOff) {
          delete = true;
        }
      }
    }
    leaves = newLeaves;
  }

  boolean run() {
    if (!delete) {
      addPoint();
      display();
      return false;
    } else {
      if (runsBright <= endRunsBright) {
        display();
        ++runsBright;
        return false;
      } else {
        return true;
      }
    }
  }
}