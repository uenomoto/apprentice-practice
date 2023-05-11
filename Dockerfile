# RubyのみなのでRails使う時は改良余地あり(DBとnode.js)
FROM ruby:3.2.1
RUN apt-get update -qq && apt-get install -y build-essential zsh git && chsh -s /bin/zsh
# ローカルマシンの.zshrcファイルをコンテナにコピー
COPY .zshrc /root/.zshrc
# oh-my-zshのインストール
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# zshプラグインのインストール
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
  git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Rubyの設定
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
# 環境変数の設定
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
CMD ["tail", "-f", "/dev/null"]

# docker run -d -v $(pwd):/app -e LANG=ja_JP.UTF-8 -e TZ=Asia/Tokyo image名
# docker exec -it コンテナID　zsh
# この二つのコマンドでcomposeなしで起動できる(composeは２つ以上のコンテナを同時に起動するとき活躍する)