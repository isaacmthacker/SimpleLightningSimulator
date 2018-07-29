

int groundHeight = 50;
float lightningCutoff;
float cloudHeight = 25;
Clouds clouds;
LightningManager lightning;
Rain rain;
void setup() {
  size(800, 500);
  lightningCutoff = height - (groundHeight/2.0);
  lightning = new LightningManager(lightningCutoff);
  clouds = new Clouds(cloudHeight);
  rain = new Rain(groundHeight, cloudHeight);
}


void draw() {
  background(0);
  ellipse(width/2.0, height/2.0, 10, 10);
  float x=50*cos(PI) + width/2.0;
  float y = 50*sin(PI) + height/2.0;
  ellipse(x, y, 20, 20);
  drawBackground();

  //arc(width/2.0, height/2.0, 50, 50, -PI/2.0, PI/2.0);
}

void drawBackground() {
  background(color(0, 0, 100));
  fill(color(0, 50, 0));
  stroke(color(0, 50, 0));
  rect(0, height-groundHeight, width, groundHeight);
  rain.run();
  lightning.run();
  clouds.display();
}