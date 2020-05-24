class StateTitle extends State {
  //初期設定をする場所です。
  void __init__() {
  }

  //ここが実行されています。
  void drawState() {
    BackPicture(TitleRogo1);
  }

  //次の画面に飛ぶ判定をしています。
  State decideState() {
    if (mo.isPress(mousePressed)) {
      return new StateMainMenu();
    }
    return this;
  }
}

/*
MainTitle maintitle;
class MainTitle {
  PImage Rogo;

  MainTitle(PImage rogo) {//コンストラクタ
    Rogo=rogo;
  }
}
*/
