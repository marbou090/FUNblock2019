import java.lang.Thread.State;
import java.util.*;
State state;

void setup() {
  size(600, 600);
  Rates=loadStrings("rate.txt");
  ScoreRank[1]=int(Rates[1]);
  ScoreRank[2]=int(Rates[2]);
  ScoreRank[0]=int(Rates[0]);
  background(#C0E4FA);
  smooth();
  t_start=millis();
  sethex();
  state = new TitleState();
}

void draw() {
  state = state.doState();//常に今の状態が更新されるdostateを常に代入し続ける
}

void mouseClicked() {
  ballfir();//ボールの発射
}

void mousePressed() {
  lev=true;
  if (lev) {
    levelx=mouseX;
    levely=mouseY;
    resultx=mouseX;
    resulty=mouseY;
  }
  minimenu=true;
  if (minimenu) {
    minix=mouseX;
    miniy=mouseY;
  }
  pose=true;
  if (pose) {
    pox=mouseX;
    poy=mouseY;
  }
}
