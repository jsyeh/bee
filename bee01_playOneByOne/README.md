Spelling Bee Game
=================

Spelling Bee 是小學裡面的一種英文競賽, 由出題者唸出英文單子, 小朋友們就試著把英文單字拼出來。我猜可能這些小朋友們在拼字時, 就像蜜蜂一樣, 所以叫 Spelling Bee 吧。

因為我家兒子的寒假作業, 學校規定要背 Spelling Bee 的單字, 我就想要寫個程式, 來模式這樣的競賽過程: 先唸出發音, 接下來小朋友要把單字拼出來。

在這個版本, 我利用 Google 的字典 MP3 來發音。利用下方 Reference 提供的資訊, 可以有 gb 或 us 的口音。

Reference:
-  https://www.techvigil.com/tips-tricks/347/mp3-pronunciation-files/
- https://ssl.gstatic.com/dictionary/static/sounds/oxford/example--_us_1.mp3
以下的字典的 Ctrl-U 原始碼中, 有對應的 mp3 檔, 但網址有幾種變型,所以我就用手動下載
- https://www.oxfordlearnersdictionaries.com/definition/english/example?q=example
- https://dictionary.cambridge.org/dictionary/english/example
- curl -o "OOXX.mp3" https://MP3的網址

單字庫
------
因為寒假快要結束, 開學就要考 Spelling Bee 競賽, 所以我就叫我兒子自己用 Google Spreadsheet 把文化國小的 Spelling Bee 的單字範圍 (268-1095) 輸入單字。

接下來, 我將單字匯出 csv 檔, 讓 Processing 可以讀入。

發音的部分, 是使用 Processing 的 SoundFile, 程式開發時需要:
- (1) Import Processing SoundFile
- (2) 程式第1行要有 `import processing.sound.*;`
- (3) 宣告 `SoundFile sound;`
- (4) 在 void setup() 裡, `sound = new SoundFile(this, "檔名或URL");`
- (5) 要播放時, `sound.play();`

```Processing
//https://www.techvigil.com/tips-tricks/347/mp3-pronunciation-files/
//上面網址介紹 Google 有提供一些發音, 包含 gb 或 us 的口音
Stirng URL = "https://ssl.gstatic.com/dictionary/static/sounds/oxford/example--_us_1.mp3";
SoundFile sound = new SoundFile(this, URL);
sound.play();
```

為了避免在網路重覆下載 mp3 檔, 所以在程式執行之前, 
需要先把所有的 mp3 檔案都下載檔案。
執行時, 會直接在 data 資料夾裡找檔案。

(如果檔案不在 data 資料夾, 那就需要上網連線找, 約延遲10秒)

改使用 Minim
------------
因為 SoundFile 開啟太多時, 就會出問題, 所以改用 [Minim](https://github.com/ddf/Minim)

程式架構
--------


使用者可以利用鍵盤來打字, 可以用 Backspace鍵來刪除前一個字母。可以利用英文字母、空白鍵, 來輸入英文單字或句子。每次輸入句子後, 再度按下 Enter鍵, 就又會再度發音。


程式碼
------

```Processing
```

執行畫面
--------


遇到的問題
----------
好像有些字找不到, 可能是拼字錯誤, 可能是單複數問題
```
二月 09, 2021 10:30:40 下午 com.jsyn.devices.javasound.JavaSoundAudioDevice <init>
資訊: JSyn: default output latency set to 80 msec for Windows 10
Sound library error: unable to decode sound file nack.mp3
Sound library error: unable to decode sound file costune.mp3
Sound library error: unable to decode sound file T-shirt.mp3
Sound library error: unable to decode sound file socks.mp3
Sound library error: unable to decode sound file shoes.mp3
Sound library error: unable to decode sound file sneakers.mp3
Sound library error: unable to decode sound file slippers.mp3
Sound library error: unable to decode sound file sandals.mp3
Sound library error: unable to find file do laundry.mp3
Sound library error: unable to decode sound file servies.mp3
Sound library error: unable to find file police officer.mp3
Sound library error: unable to find file marine animal.mp3
```

看檔案大小, 有些檔案是錯誤訊息。
```
2021/02/09  下午 10:36             1,606 PE.mp3
2021/02/09  下午 10:52             1,607 May.mp3
2021/02/09  下午 10:50             1,608 Asia.mp3
2021/02/09  下午 10:24             1,608 nack.mp3
2021/02/09  下午 10:52             1,608 July.mp3
2021/02/09  下午 10:52             1,608 Jane.mp3
2021/02/09  下午 10:51             1,609 Japan.mp3
2021/02/09  下午 10:51             1,609 woods.mp3
2021/02/09  下午 10:51             1,609 Italy.mp3
2021/02/09  下午 10:51             1,609 Korea.mp3
2021/02/09  下午 10:52             1,609 March.mp3
2021/02/09  下午 10:51             1,609 Egypt.mp3
2021/02/09  下午 10:50             1,609 Earth.mp3
2021/02/09  下午 10:26             1,609 shoes.mp3
2021/02/09  下午 10:26             1,609 socks.mp3
2021/02/09  下午 10:34             1,609 chips.mp3
2021/02/09  下午 10:51             1,609 China.mp3
2021/02/09  下午 10:49             1,609 cards.mp3
2021/02/09  下午 10:45             1,609 boark.mp3
2021/02/09  下午 10:52             1,609 April.mp3
2021/02/09  下午 10:43             1,609 habby.mp3
2021/02/09  下午 10:52             1,610 Sunday.mp3
2021/02/09  下午 10:37             1,610 stairs.mp3
2021/02/09  下午 10:51             1,610 Brazil.mp3
2021/02/09  下午 10:51             1,610 turkey.mp3
2021/02/09  下午 10:52             1,610 August.mp3
2021/02/09  下午 10:52             1,610 eithth.mp3
2021/02/09  下午 10:52             1,610 Monday.mp3
2021/02/09  下午 10:52             1,610 thenth.mp3
2021/02/09  下午 10:50             1,610 Africa.mp3
2021/02/09  下午 10:50             1,610 Europe.mp3
2021/02/09  下午 10:51             1,610 weater.mp3
2021/02/09  下午 10:52             1,610 Friday.mp3
2021/02/09  下午 10:52             1,610 fourty.mp3
2021/02/09  下午 10:51             1,610 Taiwan.mp3
2021/02/09  下午 10:51             1,610 Canada.mp3
2021/02/09  下午 10:50             1,611 suprise.mp3
2021/02/09  下午 10:50             1,611 America.mp3
2021/02/09  下午 10:52             1,611 Wensday.mp3
2021/02/09  下午 10:30             1,611 seafool.mp3
2021/02/09  下午 10:36             1,611 Enlgish.mp3
2021/02/09  下午 10:27             1,611 servies.mp3
2021/02/09  下午 10:52             1,611 October.mp3
2021/02/09  下午 10:52             1,611 January.mp3
2021/02/09  下午 10:51             1,611 Chinese.mp3
2021/02/09  下午 10:26             1,611 T-shirt.mp3
2021/02/09  下午 10:26             1,611 sandals.mp3
2021/02/09  下午 10:52             1,611 festval.mp3
2021/02/09  下午 10:25             1,611 costune.mp3
2021/02/09  下午 10:52             1,611 Tuesday.mp3
2021/02/09  下午 10:26             1,612 slippers.mp3
2021/02/09  下午 10:52             1,612 February.mp3
2021/02/09  下午 10:50             1,612 American.mp3
2021/02/09  下午 10:36             1,612 Internet.mp3
2021/02/09  下午 10:52             1,612 December.mp3
2021/02/09  下午 10:52             1,612 November.mp3
2021/02/09  下午 10:52             1,612 Thursday.mp3
2021/02/09  下午 10:52             1,612 Saturday.mp3
2021/02/09  下午 10:52             1,613 Christmas.mp3
2021/02/09  下午 10:52             1,613 September.mp3
2021/02/09  下午 10:50             1,613 Australia.mp3
2021/02/09  下午 10:30             1,613 vagetable.mp3
2021/02/09  下午 10:51             1,614 Antarctica.mp3
2021/02/09  下午 10:35             1,614 chopsticks.mp3
2021/02/09  下午 10:34             1,614 butterfuly.mp3
2021/02/09  下午 10:52             1,615 o'clock.mp3
```

Memory用盡
```
142 410 vet
143 411 engineer
144 412 housewife
145 413 police officer
146 414 player
147 415 king
OutOfMemoryError: Java heap space
An OutOfMemoryError means that your code is either using up too much memory
because of a bug (e.g. creating an array that's too large, or unintentionally
loading thousands of images), or that your sketch may need more memory to run.
If your sketch uses a lot of memory (for instance if it loads a lot of data files)
you can increase the memory available to your sketch using the Preferences window.
OutOfMemoryError: Java heap space
```