//開發時, 先以 Java Mode 開發完成, 再轉成 Android Mode
import ddf.minim.*;
Minim minim;
int MAX_WORD=3000; //目前限制不超過3000單字,若超過就修改 MAX_WORD
String [] wordlist = new String[MAX_WORD]; //讀入csv的單字Word
int [] wordID = new int[MAX_WORD]; //讀入csv的編號Number
int wordN=0; //目前讀入的單字數
Table csv;
void setup(){
  fullScreen(); //播放時全螢幕, 讓 Android 可以看清楚
  //orentation(LANDSCAPE); //Android 模式使用橫式, 字可以大一點

  textSize(width/5); //字大一點, 先設超大字, 之後再縮放合適大小
  textAlign(CENTER,CENTER); //字置中
  float maxTextWidth=10;
  
  csv = loadTable("00wordlist.csv", "header");
  minim = new Minim(this);
  for(TableRow row : csv.rows()){
    wordID[wordN] = int(row.getInt("ID"));
    String word = row.getString("Word");
    wordlist[wordN] = word;
    if(textWidth(word)>maxTextWidth) maxTextWidth=textWidth(word);
    wordN++;
  }
  //依 csv 裡最長單字(的字寬) 縮放字型大小, 讓最長單字能完整秀出來
  textSize(width/5/maxTextWidth*width);
  
  nextWord(); //一啟動就讀第1個字
}
int nowWord=-1;
AudioPlayer player=null;
void nextWord(){
  if(player!=null) player.close(); //close()釋放前一個音檔, 就不會耗盡memory
  
  nowWord=(nowWord+1)%wordN; //目前先循序唸全部的字
  //nowWord = int(random(wordN)); //之後要 random()決定下一個字

  println(nowWord, wordID[nowWord], wordlist[nowWord]); //讀到哪個字(Debug用)
  do{ //下面while()會堅持成功讀到 mp3 檔後,才會播放
    player = minim.loadFile(wordlist[nowWord]+".mp3");
  } while(player==null);
  player.play();
}
void mousePressed(){
  nextWord(); //測試時 mousePressed 換下一個字
}
int playMode=4; //1: 固定時間nextWord(), 2: 播完馬上nextWord(), 3: 播完等0.5秒再nextWord()  
int waitT=0;
void draw(){
  if(playMode==1){ //播放模式1: 設定成每 60 frames (1秒), 就換下一個字
    if(frameCount%10==0) nextWord(); 
  }else if(playMode==2){ //播放模式2: 如果聲音播放完畢, 就換下一個字
    if(!player.isPlaying()) nextWord(); 
  }else if(playMode==3){ //播放模式3: 播完後, 等1秒再換下一個字
    if(!player.isPlaying()) waitT--; //播完就持續倒數計時, 慢慢耗盡 waitT
    else waitT=30; //還沒播完就設 waitT=30 表示之後會等待 0.5 秒
    if(waitT==0) nextWord(); //waitT 耗盡, 就換下一個字
  }
  background(255);
  fill(0);
  text(wordID[nowWord]+":", 0,0, width,height/2); //上方顯示 spelling bee 的單字編號wordID
  text(wordlist[nowWord], 0,0, width,height); //中間顯示 spelling bee 的單字 Word
}
