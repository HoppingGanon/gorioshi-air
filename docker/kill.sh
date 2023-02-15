#!/bin/bash

# 実行しているプロセス「main」を終了するスクリプト

pid=`pidof main`
if [[ "$pid" != "" ]]; then
    echo "プロセスID$pidを停止しています..."
    kill $pid
fi
