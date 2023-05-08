# 基本イメージとして、Node.js がインストールされたイメージを選択
FROM node:latest

SHELL ["/bin/bash", "-c"]
ENV PATH="~/.foundry/bin:${PATH}"

# 作業ディレクトリを設定
WORKDIR /app

# 必要なパッケージのインストールとFoundryのインストールを1つのRUNで実行
RUN apt-get update && \
  apt-get install -y curl bash yarn && \
  curl -L https://foundry.paradigm.xyz | bash && \
  source ~/.bashrc && \
  foundryup

# 依存関係をインストール
COPY package*.json yarn.lock ./
RUN yarn install

# アプリケーションのソースコードをコピー
COPY . .
