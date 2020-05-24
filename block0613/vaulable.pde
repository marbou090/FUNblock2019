//六角形を描く
int vertex_num = 6; //頂点数(六角形を描画)
int R = 20; //頂点から中心までの距離(半径)

long t_start;//秒数カウントの開始
float t;//その状態になってからの秒数
float T;//ポーズ画面用のｔ記録係
int seccon=0;//追加したブロック列の個数

ArrayList kinok=new ArrayList();//ボール飛ばす際のマウスがクリックした座標をいれる

float dx;//ボールの速度
float dy;
float x=300;//ボールの初期値
float y=550;
float X;//ポーズ画面用のｘ記録係
float Y;//上に同じく

int[] hexarrayx=new int[18];//ブロックの座標
int[] hexarrayy=new int[23];

int[][] colorarray=new int[18][23];//ブロックの色
int[][] recolor=new int[1000][1000];//追加ブロックの色をランダムで用意

int[] ScoreRank=new int [4];


int [] ballcol=new int[1000];//ボール色をランダムで用意
int ballcount=0;//ボールの色何個目をとるか
color ballc;//クリックの色を暗記させてる

int score=0;//スコア計算

int levelx;///レベル決定の際にクリック座標を見る
int levely;
int resultx; //リザルト画面でのクリック座標を見る
int resulty;
int pox;
int poy;

boolean pose=false;
boolean lev=false;//レベル画面にとぶため
boolean res=false;//リザルト画面にとぶため
boolean minimenu=false;
int minix;
int miniy;
