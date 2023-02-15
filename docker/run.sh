#!/bin/bash

# Goのソースコードをビルドして実行するスクリプト

#プロセスを終了
bash /develop/script/go/kill.sh

# フォルダ作成
if [ ! -d ./tmp ]; then
    mkdir ./tmp
fi

# ビルド
echo ビルドしています...
go build -o ./tmp/main .

echo 起動します...
./tmp/main
