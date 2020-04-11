# ganymede

## 概要
### What is this ?
データ分析に利用する様々なパッケージを詰め込んだPythonの環境

## 使い方 
### ビルド

以下のコマンドによって、マシンの中にイメージが作成される。このコマンドは、最初に1回だけ行えば良い。

```
$ make
```



### Jupyterの起動

これは、利用の度に行う

```
$ docker run --rm -v [ホスト側の絶対パス]:/root/work -p [ホスト側のポート]:8888
```
