## 外部ライブラリを使うことができる

### パッケージの依存関係管理ツール

- パッケージ管理ツールとは、外部ライブラリの依存関係を管理するためのツールです。
  Ruby では Bundler が使用されています。以下のことを実行してください。

- Bundler は、Ruby プロジェクトに必要な外部ライブラリ（gem）の依存関係を管理するためのツールです。

Ruby プロジェクトでは、他の人が作成したライブラリ（gem）を使用してプログラムを書くことが一般的です。

しかし、これらのライブラリが他のライブラリに依存している場合、

依存関係のあるすべてのライブラリをインストールしなければならないことがあります。

このような場合、プロジェクトで使用するすべてのライブラリを個別に管理するのは非常に手間がかかります。

Bundler を使用することで、プロジェクトに必要なすべてのライブラリとその依存関係を一元管理できるため、

簡単かつ効率的にプロジェクトを管理できます。

具体的には、Bundler はプロジェクトごとに必要なライブラリを定義したファイル（Gemfile）を作成し、

そのファイルに基づいてライブラリを自動的にインストールします。これにより、

他の開発者が同じプロジェクトに参加した場合でも、同じライブラリとバージョンを使用することができます。