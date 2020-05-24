//画像を表示させる
void BackPicture(PImage picture) {//今回は全ての画像がウィンドウと同じサイズなので位置パラメータは固定
  image(picture, 0, 0);
}

//受け取ったbool型のものを、trueにした瞬間にfalseにしてる。
MouseOperation mo;
class MouseOperation {
  int mouseKey;

  MouseOperation(int i) {
    mouseKey=i;
  }

  boolean isPress(boolean isMousefunc) {
    /*
    使い方
     if (mo.isPress(mousePressed)&&mouseの座標など)で、trueになってもすぐ閉じてもらえる。
     releasedは必要になったら作る。
     */
    if (isMousefunc&&mouseKey==1) {
      mouseKey=0;
      return true;
    } else {
      return false;
    }
  }
}

void mouseReleased() {
  mo = new MouseOperation(0);
}
void mousePressed() {
  mo = new MouseOperation(1);
}

//テキストファイル読み込んだ時点ではString型なのでそれを変換する
int[] chamgeType(String [] rate) {
  int intRate[]=new int[3];
  intRate[1]=int(rate[1]);
  intRate[2]=int(rate[2]);
  intRate[0]=int(rate[0]);

  return intRate;
}
