# ganymede

## 概要: What is this ?
データ分析に利用する様々なパッケージを詰め込んだPythonの環境

## 使い方
### 準備

以下のコマンドによって、マシンの中にイメージがダウンロードされる。このコマンドは、最初に1回だけ行えば良い。

```
$ docker pull hotokudtws/ganymede
```

### Jupyterの起動 & 終了

```
$ docker run -it --rm -v [ホスト側の絶対パス]:/root/work -p [ホスト側のポート]:8888 --name [コンテナ名] hotokudtws/ganymede
```

* -vの`[ホスト側のパス]`の部分には、ホストマシン側の作業ディレクトリの**絶対パス**を書く。これによって、`[ホスト側のパス]`とコンテナ側の/root/workが繋がり、ホストからもコンテナからもアクセスできるようになる
* -pの`[ホスト側のポート]`には、適当に空いているポートを入れる。これによって、`[ホスト側のポート]`とコンテナ側の8888番ポートが繋がる 
* --nameの`[コンテナ名]`には、適当な文字列を入れる。起動中のコンテナと同じ名前だとエラーとなる。起動中のコンテナは、`docker ps`コマンドで確認可能
* dockerの起動は、任意のディレクトリから実行できる

```
To access the notebook, open this file in a browser:
    file:///root/.local/share/jupyter/runtime/nbserver-7-open.html
Or copy and paste one of these URLs:
    http://bbb425807403:8888/?token=[ランダムな文字列]
 or http://127.0.0.1:8888/?token=[ランダムな文字列]
```

一連の起動ログの最後に上のようなメッセージが出る。これを確認したら、ブラウザで`http://localhost:[ホスト側のパス]/[ランダムな文字列]`にアクセスすればJupyterにアクセスできる。

終了するには、Jupyterを起動したターミナルで`Ctrl-c`を押す。

### ターミナルにログイン
終了するには、Jupyterを起動したターミナルで`Ctrl-c`を押す。

```
$ docker run -it --rm -v [ホスト側の絶対パス]:/root/work --name [コンテナ名] hotokudtws/ganymede /bin/bash
```

-pがなくなったのと、最後に`/bin/bash`がくっついたの以外は、Jupyter起動と同じである。終了するには`Ctrl-d`を押す。


### Jupyterの起動 & 終了（Mac用）

起動用スクリプトとしてganymedeファイルを用意した。以下のように、コマンド1発で起動・終了ができる。

#### 起動
```
ganymede
```
起動時には、以下のオプションを受け付ける

* -p: ホスト側のポート番号
* -v: ホスト側の絶対パス
* -n: コンテナ名

#### 終了
```
ganymede -e
```


