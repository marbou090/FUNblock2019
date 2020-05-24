int [][] exhau=new int [18][23];

void Exhaustive(int i, int j) {//座標指定すれば周りのフラグをたててくれる
  exhau[i][j]=exhau[i][j]+3;//自分のフラグをおる
  exhau[i-1][j-1]=exhau[i-1][j-1]+1;//周りのフラグをたてる
  exhau[i-1][j+1]=exhau[i-1][j+1]+1;
  exhau[i+1][j-1]=exhau[i+1][j-1]+1;
  exhau[i+1][j+1]=exhau[i+1][j+1]+1;
  exhau[i][j+2]=exhau[i][j+2]+1;
  exhau[i][j-2]=exhau[i][j-2]+1;
}

ArrayList takenoko=new ArrayList();
void Discrimination() {
  for (int i=1; i<17; i++) {
    for (int j=2; j<21; j++) {
      color bbb=4;
      int refX=hexarrayx[i];//ブロックの座標
      int refY=hexarrayy[j];
      int a=colorarray[i][j];//ブロックの色
      int w=ballcol[ballcount];//ボールの色を持ってきてる
      color blockc=4;
      color blockp=color(#44200D);
      color blockh=color(#44200D);
      color blockd=color(#44200D);
      color blocke=color(#44200D);
      color blockf=color(#44200D);
      color blockb=color(#44200D);
      int p =colorarray[i-1][j-1];
      if (p==0) {
        blockp=color(#8DDCD6);
      } else if (p==1) {
        blockp=color(#B3524B);
      } else if (p==2) {
        blockp=color(#F3E384);
      } else if (p==3) {
        blockp=color(#F9A656);
      } else {
        blockp=color(#44200D);
      }
      int b = colorarray[i-1][j+1];
      if (b==0) {
        blockb=color(#8DDCD6);
      } else if (b==1) {
        blockb=color(#B3524B);
      } else if (b==2) {
        blockb=color(#F3E384);
      } else if (b==3) {
        blockb=color(#F9A656);
      } else {
        blockb=color(#44200D);
      }
      int h = colorarray[i+1][j-1];
      if (h==0) {
        blockh=color(#8DDCD6);
      } else if (h==1) {
        blockh=color(#B3524B);
      } else if (h==2) {
        blockh=color(#F3E384);
      } else if (h==3) {
        blockh=color(#F9A656);
      } else {
        blockh=color(#44200D);
      }
      int d = colorarray[i+1][j+1];
      if (d==0) {
        blockd=color(#8DDCD6);
      } else if (d==1) {
        blockd=color(#B3524B);
      } else if (d==2) {
        blockd=color(#F3E384);
      } else if (d==3) {
        blockd=color(#F9A656);
      } else {
        blockd=color(#44200D);
      }
      int e = colorarray[i][j-2];
      if (e==0) {
        blocke=color(#8DDCD6);
      } else if (e==1) {
        blocke=color(#B3524B);
      } else if (e==2) {
        blocke=color(#F3E384);
      } else if (e==3) {
        blocke=color(#F9A656);
      } else {
        blocke=color(#44200D);
      }
      int f = colorarray[i][j+2];
      if (f==0) {
        blockf=color(#8DDCD6);
      } else if (f==1) {
        blockf=color(#B3524B);
      } else if (f==2) {
        blockf=color(#F3E384);
      } else if (f==3) {
        blockf=color(#F9A656);
      } else {
        blockf=color(#44200D);
      }
      if (a==0) {
        blockc=color(#8DDCD6);
      } else if (a==1) {
        blockc=color(#B3524B);
      } else if (a==2) {
        blockc=color(#F3E384);
      } else if (a==3) {
        blockc=color(#F9A656);
      } else {
        blockc=color(#44200D);
      }


      if (w==0) {
        ballc=color(#8DDCD6);
      } else if (w==1) {
        ballc=color(#B3524B);
      } else if (w==2) {
        ballc=color(#F3E384);
      } else if (w ==3) {
        ballc=color(#F9A656);
      }

      float RR=sqrt(sq(x-refX)+sq(y-refY));
      if (RR<=25&&blockc!=color(#44200D)) {//色付きブロックとボールが当たったら
        exhau[i][j]=1; //そこの座標のフラグをたてる
      }
      if (exhau[i][j]!=0) {//その座標にフラグが立ってたら(ブロックのあたり判定にかかわらずここは回る)
        takenoko.add(color(ballc));
        bbb =( color) takenoko.get(0);
        println(blockc,takenoko.get(0));
        if (blockc==bbb && j>0) {//その座標でのブロックとボールの色が一致したら
          colorarray[i][j]=4;//上から塗りなおし
          fuckcolor(4);
          drawPolygon(refX, refY, R, vertex_num);
          score=score+100;//スコアを足す
          Exhaustive(i, j);//周りにフラグをたてる
        } else {//ボールとブロックが一致してなかったら
          exhau[i][j]=0; //そこの座標のフラグをおる
        }
      }
      if (RR<=25&&blockc!=color(#44200D)) {//色付きブロックとボールが当たったら
        if (blockc!=bbb) {//ブロックと違う色だったら
          // if (blockp!=bbb&&blockh!=bbb&&blockd!=bbb&&blocke!=bbb&&blockf!=bbb&&blockb!=bbb) {//周りがボールと同じ色でなかったら
          takenoko = new ArrayList();
          //}
          kinok = new ArrayList();//ボールの初期化
          x=300;
          y=550;
          dx=0;
          dy=0;
          ballcount=ballcount+1;
        }
      }

      if (exhau[i][j]!=0) {
        if (blockp!=bbb&&blockh!=bbb&&blockd!=bbb&&blocke!=bbb&&blockf!=bbb&&blockb!=bbb) {//&&blockp!=color(#44200D)&&blockh!=color(#44200D)&&blockd!=color(#44200D)&&blocke!=color(#44200D)&&blockf!=color(#44200D)&&blockb!=color(#44200D)) {
          takenoko = new ArrayList();
          exhau[i][j]=0;
          kinok = new ArrayList();//ボールの初期化
          x=300;
          y=550;
          dx=0;
          dy=0;
        }
      }
    }
  }
}


void dotline() {
  background(#44200D);
  stroke(#F3E384);
  strokeWeight(5);
  int x1 = width/2;
  int y1 = 550;
  int x2 = mouseX;
  int y2 = mouseY;
  for (int i = 0; i <= 10; i++) {
    float px = lerp(x1, x2, i/10.0);
    float py = lerp(y1, y2, i/10.0);
    point(px, py);
  }
}

void drawPolygon(int x, int y, int r, int vertexNum) {
  strokeWeight(1);
  pushMatrix();
  translate(x, y);
  beginShape();
  for (int i = 0; i < vertexNum; i++) {
    vertex(r*cos(radians(360*i/vertexNum)), r*sin(radians(360*i/vertexNum)));
  }
  endShape(CLOSE);
  popMatrix();
}

void timecount() {
  t = (millis() - t_start) / 1000.0;
}


void ballfir() {//弾を飛ばす
  int X;
  int  Y;
  float XX;
  float YY;
  float x0=300;
  float y0=550;
  float w;

  X=mouseX;
  Y=mouseY;
  kinok.add(new Float (X));
  kinok.add(new Float (Y));
  XX = (Float)kinok.get(0);
  YY =(Float) kinok.get(1);

  w=sqrt(sq(XX-x0)+sq(YY-y0));
  dy=(YY-y0)/w;
  dx=(XX-x0)/w;
}

void ballredraw() {//弾の2発目以降を表示させる
  int a=ballcol[ballcount];
  if (a==0) {
    fill(#8DDCD6);
  } else if (a==1) {
    fill(#B3524B);
  } else if (a==2) {
    fill(#F3E384);
  } else if (a ==3) {
    fill(#F9A656);
  } else {
    fill(#44200D);
  }
  x=x+dx*15;
  y=y+dy*15;
  stroke(#44200D);
  strokeWeight(1);
  ellipse(x, y, 20, 20);
  if (y>height||y<0||x>width||x<0) {
    kinok = new ArrayList();
    x=300;
    y=550;
    dx=0;
    dy=0;
  }
}

void reflectionWall() {
  if (x<10) {
    dx=-dx;
  }
  if (x>width-10) {
    dx=-dx;
  }
}

void sethex() {//これで全てのブロックの座標XとYはでた。書いてはいない。
  for (int i=0; i<18; i=i+2) {
    for (int j=0; j<23; j=j+2) {
      int centerX = 2*(R-3)*i;
      int centerY = (R*j);
      hexarrayx[i]=centerX;//(0,2,4,6,8,10)
      hexarrayy[j]=centerY;//(0,2,4,6,8,10,12)
    }
  }
  for (int i=1; i<18; i=i+2) {
    for (int j=1; j<23; j=j+2) {
      int  centerX = 2*(R-3)*i;
      int  centerY = (R*j);
      hexarrayx[i]=centerX;//(1,3,5,7,9)
      hexarrayy[j]=centerY;//(1,3,5,7,9,11)
    }
  }
}

void fuckcolor(int x) {
  if (x==0) {
    fill(#8DDCD6);
  } else if (x==1) {
    fill(#B3524B);
  } else if (x==2) {
    fill(#F3E384);
  } else if (x ==3) {
    fill(#F9A656);
  } else {
    fill(#44200D);
  }
}

void colordraw() {//その場所に色を塗ってる
  noStroke();
  for (int i=1; i<18; i=i+2) {
    for (int j=2; j<23; j=j+2) {
      int centerX=hexarrayx[i];
      int centerY=hexarrayy[j];
      int x=colorarray[i][j];
      if (x!=4) {
        fuckcolor(x);
        drawPolygon(centerX, centerY, R, vertex_num);
      }
    }
  }
  for (int i=2; i<18; i=i+2) {
    for (int j=3; j<23; j=j+2) {
      int  centerX=hexarrayx[i];
      int centerY=hexarrayy[j];
      int x=colorarray[i][j];
      if (x!=4) {
        fuckcolor(x);
        drawPolygon(centerX, centerY, R, vertex_num);
      }
    }
  }
  stroke(0);
}

int secc=0;
void recol() {//色を描いてる
  if (t>8) {
    secc=secc+1;
    seccon=seccon+1;
  
    t_start = millis();
    t = (millis()-t_start);
    for (int i=16; i>0; i=i-2) {
      for (int j=19; j>1; j=j-2) {
        int recol=colorarray[i][j];
        colorarray[i][j+2]=recol;
      }
    }
    for (int i=15; i>0; i=i-2) {
     for (int j=20; j>1; j=j-2) {
       int recol=colorarray[i][j];
       colorarray[i][j+2]=recol;
     }
   }
  }
}

void addcolor() {//新しい一列を決めてる
  // println(seccon);
  for (int i=1; i<17; i=i+2) {
    for (int j=2; j<3; j=j+2) {
      int  recol=recolor[i+seccon*15][j+seccon*15];
      colorarray[i][j]=recol;
      // println(colorarray[i][j],recol);
    }
  }

  for (int i=2; i<17; i=i+2) {
    for (int j=3; j<4; j=j+2) {
      int  recol=recolor[i+seccon*15][j+seccon*15];
    //  println(recol);
      colorarray[i][j]=recol;
    }
  }
}

String[] lines=new String[3];
String[] Rates;
void ScoreRanking() {
  Rates=loadStrings("rate.txt");
  // ScoreRank =int(split(Rates, ','));//ストリングファイルから読み取って比較用配列に
  ScoreRank[1]=int(Rates[1]);
  ScoreRank[2]=int(Rates[2]);
  ScoreRank[0]=int(Rates[0]);
 // println(ScoreRank[0], ScoreRank[1], ScoreRank[2]);
  if (ScoreRank[3]!=0) {//比較し、並べ替えて入れなおす
    if (ScoreRank[0]<ScoreRank[3]) {//1位のスコアでた
      ScoreRank[2]=ScoreRank[2];
      ScoreRank[1]=ScoreRank[1];
      ScoreRank[0]=ScoreRank[3];
      ScoreRank[3]=0;
    } else if (ScoreRank[0]>ScoreRank[3]&&ScoreRank[1]<ScoreRank[3]) {//2位のスコアでた
      ScoreRank[2]=ScoreRank[1];
      ScoreRank[1]=ScoreRank[3];
      ScoreRank[3]=0;
    } else if (ScoreRank[1]>ScoreRank[3]&&ScoreRank[2]<ScoreRank[3]) {//3位のスコアがでた
      ScoreRank[2]=ScoreRank[3];
      ScoreRank[3]=0;
    } else {
      ScoreRank[3]=0;
    }
    //println(ScoreRank[0], ScoreRank[1], ScoreRank[2]);
  }
  String rate1=str(ScoreRank[0]);//ストリング型に変換
  String rate2=str(ScoreRank[1]);
  String rate3=str(ScoreRank[2]);
  //String[] lines = new String[3];//ストリング配列に入力
  lines[0] = rate1;
  lines[1] = rate2;
  lines[2] = rate3;
  saveStrings("rate.txt", lines);//ストリング配列をファイルに記録
}

void deadline() {
  for (int i=1; i<12
  ; i++) {
    int over=colorarray[i][11];
    if (over==0||over==1||over==2||over==3) {
      stroke(255, 70, 74);
      strokeWeight(10);
      int x1 = 0;
      int y1 = 410;
      int x2 = width;
      int y2 = 410;
      for (int s = 0; s <= 10; s++) {
        float px = lerp(x1, x2, s/10.0);
        float py = lerp(y1, y2, s/10.0);
        point(px, py);
      }
    }
  }
}
