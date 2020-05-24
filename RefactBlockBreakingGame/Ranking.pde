class StateRanking extends State {
  String[] RankingRates;

  void drawState() {
    ranking.doRank(RankingDefault, RankingNext, chamgeType(RankingRates));
  }

  void __init__() {
    ranking =new MainRanking();
    //ここよくないけどしょうがない。助けて。
    RankingRates=loadStrings("data/rate.txt");
  }


  State decideState() {
    if (mo.isPress(mousePressed)) {
      return new StateMainMenu();
    }
    return this;
  }
}

MainRanking ranking;
class MainRanking {

  MainRanking() {
  }

  void doRank(PImage rank1, PImage rank2, int []ScoreRank) {
    if (mouseX>149&&mouseX<435&&mouseY>517&&mouseY<539) {
      image(rank2, 0, 0);
    } else {
      image(rank1, 0, 0);
    }
    textSize(50);
    fill(225, 233, 172);
    text(ScoreRank[0], 212, 251);
    fill(255, 204, 64);
    text(ScoreRank[1], 212, 352);
    fill(191, 153, 48);
    text(ScoreRank[2], 212, 442);
  }


}
