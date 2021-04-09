class Mushroom
{
  
  void mushroomHead() {
  translate(550, 190);
  fill(0, 85, 125);
  strokeWeight(2);
  beginShape();
  vertex(119, 26);
  vertex(93, 37);
  vertex(78, 52);
  vertex(61, 78);
  vertex(56, 96);
  vertex(56, 104);
  vertex(67, 112);
  vertex(78, 113);
  vertex(93, 109);
  vertex(101, 107);
  vertex(124, 107);
  vertex(141, 109);
  vertex(156, 112);
  vertex(171, 117);
  vertex(182, 120);
  vertex(194, 120);
  vertex(200, 116);
  vertex(206, 105);
  vertex(208, 95);
  vertex(207, 82);
  vertex(203, 72);
  vertex(189, 55);
  vertex(175, 42);
  vertex(157, 32);
  vertex(145, 27);
  vertex(136, 26);
  vertex(119, 26);
  endShape(LINE);
}
  void mushroomEyes() {
  fill(0);
  ellipse(117, 128, 6, 3);
  ellipse(135, 129, 6, 3);
}
void mushroomBody() {
  fill(193, 185, 169);
  strokeWeight(2);
  beginShape();

  vertex(101, 106);
  vertex(105, 112);
  vertex(109, 117);
  vertex(109, 135);
  vertex(106, 146);
  vertex(99, 159);
  vertex(94, 168);
  vertex(86, 179);
  vertex(79, 192);
  vertex(75, 201);
  vertex(75, 204);
  vertex(75, 222);
  vertex(78, 231);
  vertex(83, 235);
  vertex(96, 238);
  vertex(107, 240);
  vertex(118, 242);
  vertex(139, 242);
  vertex(153, 238);
  vertex(168, 233);
  vertex(171, 230);
  vertex(173, 216);
  vertex(172, 205);
  vertex(170, 197);
  vertex(164, 185);
  vertex(146, 154);
  vertex(145, 146);
  vertex(144, 131);
  vertex(146, 125);
  vertex(149, 117);
  vertex(154, 111);
  vertex(138, 108);
  vertex(109, 106);
  vertex(101, 106);

  endShape(LINE);
}

void mushroomSpores() {
  vertex(0, 0);
  vertex(0, 0);
  vertex(0, 0);
  vertex(0, 0);

  fill(218, 177, 125);
  beginShape(); //Draw the first spore
  vertex(99, 35);
  vertex(90, 41);
  vertex(79, 52);
  vertex(85, 52);
  vertex(92, 49);
  vertex(97, 45);
  vertex(99, 40);
  vertex(99, 35);
  endShape(LINE);

  beginShape();//Draw the second spore
  vertex(115, 28);
  vertex(118, 30);
  vertex(118, 34);
  vertex(113, 37);
  vertex(107, 37);
  vertex(105, 34);
  vertex(106, 32);
  vertex(115, 28);
  endShape(LINE);

  beginShape();  //Draw the third spore
  vertex(159, 33);
  vertex(163, 31);
  vertex(171, 31);
  vertex(177, 36);
  vertex(177, 41);
  vertex(170, 43);
  vertex(160, 37);
  vertex(159, 33);

  endShape(LINE);

  beginShape();  //Draw the fourth spore
  vertex(184, 49);
  vertex(190, 50);
  vertex(197, 54);
  vertex(201, 59);
  vertex(202, 67);
  vertex(195, 61);
  vertex(184, 49);
  endShape(LINE);

  beginShape();  //Draw the fifth spore
  vertex(187, 56);
  vertex(191, 58);
  vertex(199, 67);
  vertex(201, 73);
  vertex(201, 80);
  vertex(197, 81);
  vertex(186, 69);
  vertex(184, 64);
  vertex(184, 57);
  vertex(187, 56);
  endShape(LINE);
}

void mushroomFeatures() {
  //Nose
  noFill();
  strokeWeight(2);
  beginShape(); //Drawing the nose
  vertex(121, 134);
  vertex(120, 139);
  vertex(119, 145);
  vertex(114, 150);
  vertex(110, 153);
  vertex(105, 159);
  vertex(104, 161);
  vertex(104, 169);
  vertex(108, 174);
  vertex(113, 177);
  vertex(115, 178);
  vertex(120, 177);
  vertex(128, 173);
  endShape();


  beginShape(); //Drawing the mouth
  vertex(104, 198);
  vertex(109, 197);
  vertex(120, 197);
  vertex(126, 198);
  vertex(132, 201);
  endShape();

  beginShape(); //Draw the chin
  vertex(117, 211);
  vertex(121, 211.5);
  endShape();
}

void mushroomPolen(){
    stroke(500);
    
    ellipse(45,80 +random(-0.5,0.5), 12,12);
    ellipse(55, 55 +random(-0.5,0.5), 12,12);
    ellipse(70, 35 +random(-0.5,0.5), 12,12);
    ellipse(90, 20 +random(-0.5,0.5), 12,12);
    ellipse(115, 15 +random(-0.5,0.5), 12,12);
    ellipse(140, 15 +random(-0.5,0.5), 12,12);
    ellipse(160, 20 +random(-0.5,0.5), 12,12);
    ellipse(180, 20 +random(-0.5,0.5), 12,12);
    ellipse(195, 35 +random(-0.5,0.5), 12,12);
    ellipse(210, 45 +random(-0.5,0.5), 12,12);
    ellipse(215, 65 +random(-0.5,0.5), 12,12);
    ellipse(220, 85 +random(-0.5,0.5), 12,12);    

}

  void display(){
    mushroomHead();
    mushroomBody();
    mushroomEyes();
    mushroomFeatures();
    mushroomSpores();    
    mushroomPolen();    
  }
}
