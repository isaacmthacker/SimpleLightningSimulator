class RainDrop {
  Point p;
  Point vel;
  float w;
  float h;
  color c = color(0, 0, 255);
  RainDrop(Point pp) {
    p = pp;
    w = random(-10, 10);
    h = random(1, 10);
    vel = new Point(random(-1, 1), random(5, 10));
  }
  void display() {
    fill(c);
    stroke(c);
    //line(p.x, p.y, p.x+w, p.y+h);
    ellipse(p.x, p.y, 1, 2);
  }
  void move() {
    p.x += vel.x;
    p.y += vel.y;
  }
  void run() {
    move();
    display();
  }
}