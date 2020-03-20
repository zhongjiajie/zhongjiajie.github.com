#!/usr/bin/env bash

set -exuo pipefail

echo "将会重新生成 public 文件 更新 algolia 索引 并部署到 Github 和 Coding"
hexo clean
hexo generate
hexo algolia
hexo deploy
