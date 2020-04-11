# ganymede

## 概要: What is this ?
データ分析に利用する様々なパッケージを詰め込んだPythonの環境

## 使い方
### 準備

以下のコマンドによって、マシンの中にイメージが作成される。このコマンドは、最初に1回だけ行えば良い。

```
$ make image
```

### Jupyterの起動 & 終了

```
$ docker run -it --rm -v [ホスト側の絶対パス]:/root/work -p [ホスト側のポート]:8888 hotokudtws/ganymede
```

* -v の`[ホスト側のパス]`の部分には、ホストマシン側の作業ディレクトリの**絶対パス**を書く。これによって、`[ホスト側のパス]`とコンテナ側の/root/workが繋がり、ホストからもコンテナからもアクセスできるようになる
* -p の`[ホスト側のポート]`には、適当に空いているポートを入れる。これによって、`[ホスト側のポート]`とコンテナ側の8888番ポートが繋がる

```
To access the notebook, open this file in a browser:
    file:///root/.local/share/jupyter/runtime/nbserver-7-open.html
Or copy and paste one of these URLs:
    http://bbb425807403:8888/?token=[ランダムな文字列]
 or http://127.0.0.1:8888/?token=[ランダムな文字列]
```

一連の起動ログの最後に上のようなメッセージが出る。これを確認したら、ブラウザで`http://localhost:[ホスト側のパス]/[ランダムな文字列]`にアクセスすればJupyterにアクセスできる。

終了するには、Jupyterを起動したターミナルで`Ctrl-c`を押す。
