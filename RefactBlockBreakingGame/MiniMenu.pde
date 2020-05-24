class StateMiniMenu extends State {
  void drawState() {
    BackPicture(MiniMenuDefault);
    if (mouseX>184&&mouseX<407&&mouseY>277&&mouseY<316) {
      BackPicture(MiniMenuHome);
    } else if (mouseX>124&&mouseX<476&&mouseY>395&&mouseY<429) {
      BackPicture(MiniMenuGame);
    }
  }

  void __init__() {
    //minimenu = new MainMiniMenu(MiniMenuDefault, MiniMenuGame, MiniMenuHome);
  }


  State decideState() {
    if (mo.isPress((mousePressed)&&mouseX>184&&mouseX<407&&mouseY>277&&mouseY<316)) {
      return new StateGame();
    } else if (mo.isPress((mousePressed&&mouseX>124&&mouseX<476&&mouseY>395&&mouseY<429))) {
      return new StateMainMenu();
    }
    return this;
  }
}

/*
MainMiniMenu minimenu;
 class MainMiniMenu {
 PImage toGame;
 PImage toMenu;
 PImage MiniDefault;
 
 MainMiniMenu(PImage pose1, PImage pose2, PImage pose3) {//コンストラクタ
 MiniDefault = pose1;
 toGame = pose2;
 toMenu = pose3;
 }
 }
 */
