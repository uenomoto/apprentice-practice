## 標準入出力を扱える

### 1. 標準入出力とは

標準入力、標準出力、標準エラー出力について、プログラミング初心者にわかるように説明してください。

- まずは標準入出力は、キーボードから入力、ディスプレイに出力

- 標準入力

  - プログラムの標準の入力
  - キーボードが通常に使われる

- 標準出力

  - プログラムの標準の出力
  - ディスプレイが通常に使われる

- 標準エラー出力

  - プログラムのエラーメッセージを出力
  - ディスプレイが通常に使われる

### 2. リダイレクト

リダイレクトを使用して、ルートディレクトリを ls コマンドで出力した結果を、~/root.txt という新規ファイルに保存してください。

- リダイレクトは入出力先を変更する機能
- 出力のリダイレクトはファイルに保存することができる！

- まずはルートディレクトリに移動し、`ls > root.txt`コマンド

### 3. エラー出力のリダイレクト

コマンドを実行してエラーになった際に、エラー結果を ~/error.txt という新規ファイルに保存してください。エラーを発生させるにはは例えば ls /hoge など、存在しないファイル・ディレクトリを ls コマンドで参照する方法があります。

- エラー文には`2>`をつける
- `ls /hoge 2> error.txt`
  - ホゲというファイルはないよというエラー文が error.txt に出力結果がコピーされている。
- cat error.txt で確認できます！

### 4. 出力とエラー出力のリダイレクト

ルートディレクトリと存在しないファイルを ls コマンドで一度で参照しようとして( ls / /hoge )、その両方の結果を一度に ~/result.txt という新規ファイルに保存してください。

- `ls / /hoge > result.txt 2>&1`

  - result.txt の中身に、ホゲねえよエラー文とルートディレクトリのディレクトリとファイル達が出力されています。

- おまけでそのファイルに追記で出力したいときは`echo 'add_text' >> result.txt`
  - これで result.txt に、add_text の文字が、一番下に追加されています。
- `>`が一つだと上書きされます（気をつけて）

### 5. /dev/null とは

/dev/null とは何で、どういう時に使われるものかをプログラミング初心者にわかるように説明してください。

- 入力先として指定しても何も返さず、出力として指定してもデータは消え何も表示されない。
- 例えば、コマンドは打ちたいけど、結果がわかっていて表示されるものがおおくて、処理が遅くなる場合
  に使われます。
  /dev/null コマンドを打つことで、非表示にしたおかげで、処理が速くなることがあります。

  - `コマンド > /dev/null`これで出力なので画面（ディスプレイ）に結果が非表示になる

### 6. /dev/null へのリダイレクト

ルートディレクトリを ls コマンドで参照した結果を、/dev/null にリダイレクトし、何も表示されないことを確認してください。

- `ls / > /dev/null`

### 7. パイプライン

ルートディレクトリを ls コマンドで参照した結果のうち、"l" から始まるものだけを、パイプラインを使用して一回のコマンドで表示してください。

- 複数のコマンドを繋げることができる連携機能!!

- `ls / | grep l`

  - これで`l`がついている者のみ参照できます！

- 大量の結果をスクロールで参照したい場合`ls /bin | less`
- パイプラインは３つでもできる！！

### WC コマンド

- 行数、単語数、文字数の順にカウントできるコマンドです！
  `ls /bin | wc -l`これで/bin ディレクトリが wc によって行数のみカウントできます。
  `ls /bin | wc -w` 単語数
  `ls /bin | wc -c`文字数

- /etc ディレクトリに host という文字列を含む語の数をカウント
  - `ls /etc | grep -i 'host' | wc -l`
- -i オプションを使って大文字小文字を区別せずに'host'という文字列を含むファイル名を検索
