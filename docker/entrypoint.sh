#!/bin/bash

export PATH=$PATH:/develop/app/go/bin
export GOPATH=/root/go/bin
export PATH=$PATH:/root/go/bin

if [ "$DEVELOP_BUILD" == "AIR" ]
then
  # Airでホットリロード
  echo Go Airで起動します
  echo ソースコードは自動でホットリロードされます
  air -c .air.toml
elif [ "$DEVELOP_BUILD" == "GORIOSHI" ]; then
  # ゴリ押しホットリロード
  # Airが意図したとおりに実行されない場合にはこれをつかう
  echo ゴリ押しデバッグモードで起動します
  echo ソースコードはビルドされ続けます
  for ((i=0; 1 == 1; i++)); do
      # ビルド＆実行
      bash /develop/script/go/run.sh
      # 実行が終了すると1秒待って再度ビルド＆実行しつづける
      sleep 1
  done
else
  echo "環境変数'DEVELOP_BUILD'の値'${DEVELOP_BUILD}'を識別できません"
  sleep 5
  exit 1
fi
