import guru.ttslib.*;
TTS tts;
int textH;
void setup(){
  fullScreen();
  orientation(LANDSCAPE);
  tts = new TTS();
  textH=height/10;
  textSize(textH);
  textAlign(CENTER,CENTER);
}
void draw(){
  background(255);
  fill(0);
  text(line, 0, 0, width, height);
}
String line="hello";
void keyPressed(){
  if(key>='A' && key<='Z'){
    line += key;
  }
  if(key>='a' && key<='z'){
    line += key;
  }
  if(key==' ') line+=key;
  if(keyCode==BACKSPACE && line.length()>0) line = line.substring(0, line.length()-1);
  if(keyCode==ENTER){
    tts.speak(line);
  }
}
