
Flock flock;

PImage [] image = new PImage[2];
String [] path = {
  "mahsa.png",
  "nika.png"
};


PGraphics pg;

void setup() {
  size(800, 800, P2D );
  flock = new Flock();

  pg = createGraphics(800, 800);


  for (int i=0; i<image.length; i++) {
    image[i] = loadImage(path[i]);
    image[i].resize(width, height);
    // Add an initial set of boids into the system
  }

  for (int i = 0; i < 1000; i++) {
    flock.addDot(new Dot(height, width, image[0]));
  }
}

void draw() {
  background(50);
  image(pg, 0, 0);
  flock.run();
}


void keyPressed(){
  for (int i = 0; i < flock.dots.size(); i++) {
    flock.dots.get(i).image=image[1];
  }
  
  pg.beginDraw();
  pg.clear();
  pg.endRaw();
}
