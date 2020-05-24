class StateMainMenu extends State {
  void drawState() {
    mainmenu.domainmenu(MainMenuDefault, MainMenuGame, MainMenuRanking);
  }

  void __init__() {
    mainmenu = new MainMenu();
  }

  State decideState() {
    if (mo.isPress((mousePressed)&&mouseX>156&&mouseX<437&&mouseY>225&&mouseY<262)) {
      return new StateGame();
    } else if (mo.isPress(mousePressed&&mouseX>200&&mouseX<408&&mouseY>325&&mouseY<368)) {
      return new StateRanking();
    }
    return this;
  }
}

MainMenu mainmenu;
class MainMenu {
  /*
  PImage MenuDefault, MenuGame, MenuRanking;

  MainMenu(PImage def, PImage game, PImage ranking) {
    MenuDefault = def;
    MenuGame = game;
    MenuRanking = ranking;
  }
  */

  void domainmenu(PImage MenuDefault, PImage MenuGame, PImage MenuRanking) {
    if (mouseX>156&&mouseX<437&&mouseY>225&&mouseY<262) {
      BackPicture(MenuGame);
    } else if (mouseX>200&&mouseX<408&&mouseY>330&&mouseY<368) {
      BackPicture(MenuRanking);
    } else {
      BackPicture(MenuDefault);
    }
  }
}
