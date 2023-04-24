Linux の環境を用意することができる

1. Linux を動作させる環境
   Linux を動作させる環境を用意しましょう。ご自身の好きな方法を選択いただいて大丈夫です。

AWS Cloud9 で Linux 環境を構築する(一番簡単です)

AWS で EC2 を立て、SSH で接続する(簡単です)

ローカル PC 上に Docker や VirtualBox 等で Linux の環境を用意する

パソコンに本体の OS とは別に Linux 環境を構築する。Windows なら WSL2、Mac ならデュアルブートや UTM を使用する

パソコンに Linux をインストールする

Linux の OS は何でも大丈夫ですが、Ubuntu が使いやすいのでオススメです。

Linux の QUEST は基本的にここで構築した環境上で行ってください。

---

私は、ローカル PC 上に Docker で Linux の環境を用意しました！

- 特定のディレクトリに Dockerfile と docker-compose.yml を作り Docker デスクトップアプリを使い起動しました

```Dockerfile:Dockerfile
FROM ubuntu:22.04
RUN yes | unminimize
RUN apt-get update && \
  apt-get install -y locales neovim tmux less zsh curl git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
RUN chsh -s /bin/zsh
RUN touch /root/.zshrc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
WORKDIR /linux-study

```

見た目にこだわるので、oh-my-zsh をコンテナ内でインストールしました。

**あとはアプレンティス一期生の釜谷さんを参考にしました！**

```
version: '3.7'
services:
  app:
    build: .
    tty: true
    volumes:
      - .:/linux-study
      - ~/.zshrc:/root/.zshrc
```

あとはファイル変更しないで imaga さえあれば、
`docker compose up -d`このコマンド一つで起動できます。
起動したら`docker compose exec app zsh`でコンテナ内に入り、ローカルで Linux を構築できます。

**起動する際は、Dockerfile と docker-compose.yml があるディレクトリまで移動すること！！**

もしファイル変更したら。
まずはコンテナに入っていたらコンテナから出ること！

1. `docker-compose down` 一回コンテナを削除し
2. `docker-compose build` ファイルをビルドしてから
3. `docker-compose up -d` 起動！

あとは down と up を繰り返すだけ！
