String[] Q;
String[] A;
int[] More; //要考試的單字(號碼)
ArrayList<Integer> Wrong; //曾經出錯的單字
void setup() {
  fullScreen();
  PFont font=createFont("標楷體", 100);
  textFont(font);

  Table table = loadTable("G6_2023-Spellingbee.csv");
  println( "讀入單字數: " + table.getRowCount() );
  Q = new String[table.getRowCount()];
  A = new String[table.getRowCount()];
  More = new int[table.getRowCount()];
  Wrong=new ArrayList<Integer>();
  int ii=0; //把 CSV Table 的單字 塞入 Q[i] A[i] 陣列
  for( TableRow row : table.rows() ){
    A[ii] = row.getString(1);
    Q[ii] = row.getString(2);
    ii++;
  }
  
  for (int i=0; i<Q.length; i++) More[i]=i;
  for (int i=0; i<10000; i++) { //將考試的單字順序打亂
    int a=int(random(Q.length)), b=int(random(Q.length));
    int temp=More[a]; 
    More[a]=More[b]; 
    More[b]=temp;
  }
}
int now=0, now2=0;
boolean bShowAns=false, bWrong=false, finished=false;
String line="";
void draw() {
  if(finished){
    text("比賽完畢,結束", width/2,height/2);
    return;
  }
  background(0);
  fill(255);
  now=More[now2];
  text(""+(now+1), width-textWidth(""+(now+1)), 100); //now+1 人類從1開始編號
  text(Q[now], width/2-textWidth(Q[now])/2, height/2-100);
  if (bShowAns) text(A[now], width/2-textWidth(A[now])/2, height/2+300);
  if (bWrong) fill(255, 0, 0);
  else fill(255);
  if (bShowAns || frameCount/30%2==0)text(line, width/2-textWidth(A[now])/2, height/2+100);
  else text(line+"|", width/2-textWidth(A[now])/2, height/2+100);
}
//void mousePressed(){
//  if(bShowAns){
//    now=(now+1)%Q.length;  
//    bShowAns=false;
//    bWrong=false;
//  }else bShowAns=true;
//}
void keyPressed() {
  if (key=='!') line+=key;
  if (key=='/') line+=key;
  if (key=='\'') line+=key;
  if (key=='.') line+=key;
  if (key=='-') line+=key;
  if (key>='A' && key<='Z') line+=key;
  if ((key>='a' && key<='z') || (key==' ')) line+=key;
  if (key==BACKSPACE && line.length()>0) line=line.substring(0, line.length()-1);
  if (key==ENTER && bShowAns==false) {
    bShowAns=true;
    if (!line.equals(A[now])) {
      bWrong=true;
      Wrong.add(now);
      print(now+",");
    }
  } else if (key==ENTER && bShowAns==true) {
    bShowAns=false;
    if(now2>=Q.length-1) finished=true;
    now2 = (now2+1)%Q.length;
    line="";
    bWrong=false;
  }
}
