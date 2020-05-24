class StateResult extends State {
  String[] RankingRates;
  void drawState() {
    result.doRank(doinggame.score, ResultHigh1, ResultLow1, ResultLow2);
  }

  void __init__() {
    result = new MainResult();
    RankingRates=loadStrings("data/rate.txt");
    result.ScoreRanking(chamgeType(RankingRates), doinggame.score);
  }


  State decideState() {
    if (mo.isPress(mousePressed)) {
      return new StateRanking();
    }
    return this;
  }
}

MainResult result;
class MainResult {
  /*
   PImage HighComment;
   PImage LowComment1;
   PImage LowComment2;
   int[] ScoreRank=new int[4];//テキストファイルからの情報をいれる
   int newScore;
   
   MainResult(PImage high1, PImage low1, PImage low2, int score,int[]oldscore) {
   HighComment=high1;
   LowComment1=low1;
   LowComment2=low2;
   newScore=score;
   ScoreRank=oldscore;
   }
   */


  void doRank(int newScore, PImage HighComment, PImage LowComment1, PImage LowComment2) {
    if (newScore>20000) {
      BackPicture(HighComment);
    } else if (newScore<1000) {
      BackPicture(LowComment1);
    } else {
      BackPicture(LowComment2);
    }
    textSize(50);
    fill(255, 233, 172);
    text(newScore, 120, 283);
  }

  //スコアランキングを上書きする
  void ScoreRanking(int[] infrank, int newScore) {
    //４つバージョンに書き換えて。
    if (infrank[0]<newScore) {//1位のスコアでた
      infrank[2]=infrank[2];
      infrank[1]=infrank[1];
      infrank[0]=newScore;
    } else if (infrank[0]>newScore&&infrank[1]<newScore) {//2位のスコアでた
      infrank[2]=infrank[1];
      infrank[1]=newScore;
    } else if (infrank[1]>newScore&&infrank[2]<newScore) {//3位のスコアがでた
      infrank[2]=newScore;
    } else {
      return;
    }

    String[] rate = new String[3];
    rate[0] = str(infrank[0]);
    rate[1] = str(infrank[1]);
    rate[2] = str(infrank[2]);
    saveStrings("rate.txt", rate);//ストリング配列をファイルに記録
  }
}
