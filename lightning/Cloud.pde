class Cloud {
  float x, y, w1, w2;
  color c;
  ArrayList<Point> points;
  int numPoints = int(random(10, 20));
  Cloud(color cc, float cloudHeight, float xx) {
    c = cc;
    x = xx+random(-5, 5);
    y = random(0, 1.5*cloudHeight);
    w1 = random(50, 100);
    w2 = random(20, 30);
    points = new ArrayList<Point>();
    float step = 2.0*PI/numPoints;
    for (float angle = 0; angle <= 2*PI; angle += step) {
      points.add(new Point(w1*cos(angle) + x, w2*sin(angle)+y));
      points.get(points.size()-1).cloudSize = w2;
    }
  }
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, 2*w1, 2*w2);
    float angle1 = -3*PI/4.0;
    float angle2 = 3*PI/4.0;
    float step = 2.0*PI/numPoints;
    for (int i = 0; i < points.size(); ++i) {
      Point p = points.get(i);
      //ellipse(points.get(i).x, points.get(i).y, 5, 5);
      //noFill();
      fill(c);
      stroke(0);
      strokeWeight(1);
      arc(p.x, p.y, 1.75*p.cloudSize, p.cloudSize, angle1, angle2);
      angle1 += step;
      angle2 += step;
    }
  }
}

class Clouds {
  color c = color(100);
  int numPoints = 15;
  ArrayList<Cloud> points;
  float h;
  Clouds(float cloudHeight) {
    h = cloudHeight;
    points = new ArrayList<Cloud>();
    float x = 20;
    float xstep = width/float(numPoints);
    for (int i = 0; i < numPoints; ++i) {
      points.add(new Cloud(c, h, x));
      x += xstep;
    }
  }
  void display() {
    fill(c);
    noStroke();
    //rect(0, 0, width, h);
    for (Cloud cloud : points) {
      cloud.display();
    }
  }
}