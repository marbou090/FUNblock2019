abstract class State {
  long t_start;
  float t;
  int select;

  State() {
    //t_state=mills();
  }

  State doState() {
    drawState();//状態に応じた描画を行う
    return decideState();//次に移動する状態先を返す
  }

  abstract void drawState();
  abstract State decideState();
}

class TitleState extends State {
  PImage Rogo;
  PImage titleclick;
  void drawState() {
    background(#395A67);
    Rogo=loadImage("title_1.png");
    image(Rogo, 0, 0);
    lev=false;
  }

  State decideState() {
    if (mousePressed) {
      return new LargeMenu();
    }
    return this;
  }
}

class LargeMenu extends State {
  int NEX;
  int NEY;
  PImage nullselect;
  PImage selectgame;
  PImage selectarchieve;
  PImage selecthard;
  void drawState() {
    nullselect=loadImage("bee_mainmenu.png");
    background(#B7295B);
    image(nullselect, 0, 0);
    NEX=mouseX;
    NEY=mouseY;
    if (NEX>156&&NEX<437&&NEY>225&&NEY<262) {
      background(#B7295B);
      selectgame=loadImage("bee_mainmenu_selectgame.png");
      image(selectgame, 0, 0);
    } else if (mouseX>200&&mouseX<408&&mouseY>330&&mouseY<368) {
      background(#B7295B);
      selectarchieve=loadImage("bee_mainmenu_selectranking.png");
      image(selectarchieve, 0, 0);
    }
  }

  State decideState() {
    if (lev) {
      //ここでセットアップする
      score=0;
      ballcount=0;
      seccon=0;
      secc=0;
      t_start = millis();
      for (int i=0; i<18; i++) {
        for (int j=0; j<23; j++) {
          exhau[i][j]=0;
        }
      }
      for (int i=0; i<18; i++) {//背景色にとりあえず塗っておく
        for (int j=0; j<23; j++) {
          colorarray[i][j] =4;
        }
      }
      for (int i=1; i<17; i++) {//最初の上のほうの色を決定する
        for (int j=2; j<7; j++) {
          colorarray[i][j] = int(random(4));
        }
      }

      for (int i=0; i<1000; i++) {//追加ブロックの色をランダムいれる
        for (int j=0; j<1000; j++) {
          recolor[i][j]=int(random(4));
        }
      }
      for (int i=0; i<1000; i++) {//ボールの色を決める
        ballcol[i]=int (random(4));
      }
      if (levelx>156&&levelx<437&&levely>225&&levely<262) {
        return new Game();
      } else if (mousePressed&&mouseX>200&&mouseX<408&&mouseY>325&&mouseY<368) {
        return new Ranking();
      }
    }
    return this;
  }
}


class Game extends State {
  void drawState() {
    PImage back;
    back=loadImage("back.png");
  
    dotline();
    reflectionWall();
    timecount();
     addcolor();
    colordraw();
      recol();
     Discrimination();
  
    
    deadline();
    ballredraw();//弾の2発目以降を表示させる
    image(back, 0, 500);
    noFill();
    stroke(#F3E384);
    strokeWeight(8.0);
    strokeJoin(ROUND);
    rect(430, 530, 150, 45);
    textSize(30);
    fill(#F3E384);
    text(score, 450, 560);
    for (int i=1; i<12; i++) {
      int over=colorarray[i][20];
      if (over==0||over==1||over==2||over==3) {
        res=true;
      }
    }
    T=t;
  }


  State decideState() {
    if (res) {//ここでブロックの座標が迫りすぎたら終わりにさせる
      return new Result();
    }
    if (minimenu) {
      if (mousePressed&&mouseX>15&&mouseX<91&&mouseY>512&&mouseY<582) {
        return new Pose();
      }

      minimenu=false;
    }
    res=false;
    return this;
  }
}

class Pose extends State {
  void drawState() {
    t=T;
    kinok = new ArrayList();
    x=300;
    y=550;
    dx=0;
    dy=0;
    pox=mouseX;
    poy=mouseY;
    PImage pose1;
    PImage pose2;
    PImage pose3;
    pose3=loadImage("pose3.png");
    pose2=loadImage("pose2.png");
    pose1=loadImage("pose1.png");
    image(pose1, 0, 0);
    if (pox>184&&pox<407&&poy>277&&poy<316) {
      image(pose2, 0, 0);
    } else if (pox>124&&pox<476&&poy>395&&poy<429) {
      image(pose3, 0, 0);
    }
  }

  State decideState() {
    if (pose) {
      if (pox>184&&pox<407&&poy>277&&poy<316) {
        return new Game();
      } else if (pox>124&&pox<476&&poy>395&&poy<429) {
        score=0;
        ballcount=0;
        seccon=0;
        secc=0;
        t_start = millis();
        for (int i=0; i<16; i++) {
          for (int j=0; j<18; j++) {
            exhau[i][j]=0;
          }
        }
        for (int i=0; i<13; i++) {//背景色にとりあえず塗っておく
          for (int j=0; j<17; j++) {
            colorarray[i][j] =4;
          }
        }
        for (int i=1; i<12; i++) {//最初の上のほうの色を決定する
          for (int j=2; j<8; j++) {
            colorarray[i][j] = int(random(4));
          }
        }

        for (int i=0; i<1000; i++) {//追加ブロックの色をランダムいれる
          for (int j=0; j<1000; j++) {
            recolor[i][j]=int(random(4));
          }
        }
        for (int i=0; i<1000; i++) {//ボールの色を決める
          ballcol[i]=int (random(4));
        }
        return new LargeMenu();
      }

      pose=false;
    }
    return this;
  }
}

class Result extends State {
  PImage result_high1;
  PImage result_high2;
  PImage result_low1;
  PImage result_low2;
  PImage result_low3;
  PImage result_low4;

  void drawState() {
    if (score>20000) {
      result_high1=loadImage("result_highscore1.png");
      image(result_high1, 0, 0);
    } else if (score<1000) {
      result_low1=loadImage("result_lowscore1.png");
      image(result_low1, 0, 0);
    } else {
      result_low3=loadImage("result_lowscore3.png");
      image(result_low3, 0, 0);
    }
    ScoreRank[3]=score;
    ScoreRanking();//ここでスコアを並びかえ、および記憶させる
    //background(200, 191, 231);
    PFont hello;
    hello=loadFont("UDDigiKyokashoN-B-48.vlw");
    fill(255, 233, 172);
    textFont(hello, 50);
    text(score, 120, 283);
    lev=true;
    res=false;
  }

  State decideState() {
    if (mousePressed) {
      //リスタート選択で８座標）またゲームを始める（ここで難易度を覚えさせておいてここで吐く必要がある）
      //ここでもそれぞれ選択時に関数いじって難易度を調整させる
      score=0;
      ballcount=0;
      seccon=0;
      secc=0;
      t_start = millis();
      for (int i=0; i<16; i++) {
        for (int j=0; j<18; j++) {
          exhau[i][j]=0;
        }
      }
      for (int i=0; i<13; i++) {//背景色にとりあえず塗っておく
        for (int j=0; j<17; j++) {
          colorarray[i][j] =4;
        }
      }
      for (int i=1; i<12; i++) {//最初の上のほうの色を決定する
        for (int j=2; j<7; j++) {
          colorarray[i][j] = int(random(4));
        }
      }

      for (int i=0; i<1000; i++) {//追加ブロックの色をランダムいれる
        for (int j=0; j<1000; j++) {
          recolor[i][j]=int(random(4));
        }
      }
      for (int i=0; i<1000; i++) {//ボールの色を決める
        ballcol[i]=int (random(4));
      }
      lev=false;
      return new Ranking();
    }
    return this;
  }
}

class Ranking extends State {
  void drawState() {
    PImage ranking1;
    PImage ranking2;
    PFont hello;
    ranking1=loadImage("ranking.png");
    ranking2=loadImage("ranking2.png");
    if (mouseX>149&&mouseX<435&&mouseY>517&&mouseY<539) {
      image(ranking2, 0, 0);
    } else {
      image(ranking1, 0, 0);
    }
    hello=loadFont("UDDigiKyokashoN-B-48.vlw");
    fill(225, 233, 172);
    textFont(hello, 50);
    text(ScoreRank[0], 212, 251);
    fill(255, 204, 64);
    text(ScoreRank[1], 212, 352);
    fill(191, 153, 48);
    text(ScoreRank[2], 212, 442);
  }
  State decideState() {
    if (mousePressed&&mouseX>149&&mouseX<435&&mouseY>517&&mouseY<539) {
      return new LargeMenu();
    }
    return this;
  }
}
