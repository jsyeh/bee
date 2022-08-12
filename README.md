Spelling Bee
=============
Spelling Bee - 小朋友練習英文拼單字

Introduction (介紹)
-------------------

Spelling Bee 是小學的一種英文競賽,  由出題者唸出英文單字, 小朋友們搶著把單字拼出來。我猜是一堆小朋友們在拼單字時, 就像一群嗡嗡叫的蜜蜂, 所以叫 Spelling Bee 吧。

我小兒子的2021寒假作業要背 Spelling Bee 單字, 開學要比賽。我就想要寫個程式, 讓小朋友練習把單字拼出來。

2022暑假, 小兒子又要準備學校 Spelling Bee 比賽。我請他把 PDF 檔的單字列表 改成 CSV 檔格式, 並確認資料是否正確。這樣 spelling_bee 專案便能改用 CSV 來讀入題目, 並方便使用 Excel 來修改、編修題庫。

關於 UTF-8 與 ANSI/Big5 中文編碼的問題: Processing 程式讀入 CSV 檔需要用 UTF-8 來呈現中文, 但Excel 開啟 CSV 檔需要 ANSI/Big5 才不會變成亂碼。可利用 Notepad++ 選單 Encoding 的 Convert to UTF-8 或 Convert to ANSI 來改變檔案的中文編碼。

程式版本
--------
- spelling_bee: 使用 Processing 開發的 spelling bee 考試程式。裡面使用陣列來儲在Q(中文題目)及A(英文答案), 小朋友可以看到中文題目後, 可用鍵盤來輸入英文答案。如果答錯時,會記下對應序號, 以便之後可以重考、複習考錯的單字。

- bee_tts: 這個版本是使用 Processing Sketch Library可找到的 ttslib 0.4, 聲音聽起來有點不自然(想放棄這一塊)。
