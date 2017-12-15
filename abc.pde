import geomerative.*;
import java.util.ArrayList;

RShape shapes[][] = new RShape[26][2];
ArrayList<RPoint []> points = new ArrayList<RPoint []>();

void setup() {
  size(600, 600);
  RG.init(this);
  initAbcShapes();
  for(int i = 0; i < shapes.length; i++) {
    if(shapes[i][1] == null)
      points.add(shapes[i][0].getPoints());
    else {
      RPoint [] p0 = shapes[i][0].getPoints();
      RPoint [] p1 = shapes[i][1].getPoints();
      RPoint [] p = new RPoint[p0.length + p1.length + 1];
      int count = 0;
      for(int j = 0; j < p0.length; j++, count++) {
        p[count] = p0[j];
      }
      p[count] = new RPoint(-1, -1);
      count++;
      for(int j = 0; j < p1.length; j++, count++) {
        p[count] = p1[j];
      }
      points.add(p);
    }
  }
}

void draw() {
  String str = "tired of\ninstagram\nwhich shows\nme too many\nscam ads";
  background(0);
  strokeWeight(5);
  noFill();
  stroke(255);

  translate(25, 200);
  scale(0.1, 0.1);
  pushMatrix();
  for(int j = 0; j < str.length(); j++) {
    int c = (int)str.charAt(j);
    int n = c - 'a';
    if(0 <= n && n < 26) {
      float fract = (float)(frameCount+j) / 120.0f % 1;
      RPoint p[] = points.get(n);
      int iBegin = (int)constrain(map(fract, 0.5, 1, 0, p.length - 1), 0, p.length-1);
      int iEnd = (int)constrain(map(fract, 0, 0.5, 0, p.length - 1), 0, p.length-1);
      for(int i = iBegin; i < iEnd; i++) {
        if(p[i].x > 0 && p[i+1].x > 0)
          line(p[i].x, p[i].y, p[i+1].x, p[i+1].y);
      }
    }

    if(c == '\n') {
      popMatrix();
      translate(0, 500);
      pushMatrix();
    }
    else {
      translate(500, 0);
    }
  }
  popMatrix();
  
  //int n = frameCount/30 % 26;
  //float fract = (float)frameCount / 30.0f % 1;
  //RPoint p[] = points.get(n);
  //for(int i = 0; i < map(fract, 0, 0.8, 0, p.length - 1); i++) {
  //  if(i < p.length - 1 && p[i].x > 0 && p[i+1].x > 0)
  //    line(p[i].x, p[i].y, p[i+1].x, p[i+1].y);
  //}
  
  //shapes[n][0].draw();
  
  //if(shapes[n][1] != null)
  //  shapes[n][1].draw();
}