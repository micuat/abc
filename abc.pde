import geomerative.*;
import java.util.ArrayList;

RShape shapes[][] = new RShape[26][2];
ArrayList<RPoint []> points = new ArrayList<RPoint []>();

void setup() {
  size(1200, 1200);
  RG.init(this);
  RCommand.setSegmentLength(20);
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
  String str = "net neutrality is the\nprinciple that internet\nservice providers must\n";
  str+= "treat all data on the\ninternet the same and\nnot discriminate or";
  background(0);
  strokeWeight(7);
  noFill();
  stroke(255);

  translate(25, 400);
  scale(0.1, 0.1);
  pushMatrix();
  pushMatrix();
  for(int j = 0; j < str.length(); j++) {
    int c = (int)str.charAt(j);
    int n = c - 'a';
    if(0 <= n && n < 26) {
      float fract = (float)(frameCount) / 120.0f % 1;
      RPoint p[] = points.get(n);
      int iBegin = (int)constrain(map(fract, 0.55, 0.75, 0, p.length - 1), 0, p.length-1);
      int iEnd = (int)constrain(map(fract, 0, 0.2, 0, p.length - 1), 0, p.length-1);
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
  popMatrix();

  str = "charge differently by\nuser content website\nplatform application\ntype of attached equipment\nor method of\ncommunication";
  pushMatrix();
  for(int j = 0; j < str.length(); j++) {
    int c = (int)str.charAt(j);
    int n = c - 'a';
    if(0 <= n && n < 26) {
      float fract = (float)(frameCount) / 120.0f % 1;
      RPoint p[] = points.get(n);
      int iBegin = (int)constrain(map(fract, 0.8, 1, 0, p.length - 1), 0, p.length-1);
      int iEnd = (int)constrain(map(fract, 0.25, 0.45, 0, p.length - 1), 0, p.length-1);
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
}