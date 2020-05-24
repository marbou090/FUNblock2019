//import java.lang.Thread.State;
//import java.util.*;
State state;

/*----------データ類宣言---------------------*/
//画像類
PImage TitleRogo1;//Title
PImage MainMenuDefault, MainMenuGame, MainMenuRanking;//MainMenu
PImage GameBack;//Game
PImage MiniMenuDefault, MiniMenuGame, MiniMenuHome;//MiniMenu
PImage ResultHigh1, ResultLow1, ResultLow2;//Result
PImage RankingDefault, RankingNext;//Ranking
/*--------------------------------------*/


void setup() {
  /*----------データ類読み込み---------------------*/
  //画像類
  TitleRogo1=loadImage("data/title_1.png");
  MainMenuDefault=loadImage("data/bee_mainmenu.png");
  MainMenuGame=loadImage("data/bee_mainmenu_selectgame.png");
  MainMenuRanking=loadImage("data/bee_mainmenu_selectranking.png");
  GameBack=loadImage("data/back.png");
  MiniMenuDefault=loadImage("data/pose1.png");//
  MiniMenuGame=loadImage("data/pose3.png");//
  MiniMenuHome=loadImage("data/pose2.png");
  ResultHigh1=loadImage("data/result_highscore1.png");
  ResultLow1=loadImage("data/result_lowscore1.png");
  ResultLow2=loadImage("data/result_lowscore3.png");
  RankingDefault=loadImage("data/ranking.png");
  RankingNext=loadImage("data/ranking2.png");
  /*--------------------------------------------*/
  
  size(600, 600);
  smooth();
  state = new StateTitle();
  mo = new MouseOperation(0);
}

void draw() {
  state = state.doState();
}


abstract class State {
  boolean StateFrag;//画面移動時に一度しか通らない場所を作るためのフラグ。個人的にはあまりよくない予感もしてる。

  State() {
    StateFrag=true;
  }

  State doState() {
    if (StateFrag) {
      __init__();
      StateFrag=false;
    }
    drawState();
    return decideState();
  }

  abstract void drawState();      //描画
  abstract State decideState();   //画面遷移先を返す
  abstract void  __init__();   //初期設定
}
