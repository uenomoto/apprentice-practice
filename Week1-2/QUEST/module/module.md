## モジュールについて説明できる

### 1.モジュール

- モジュールとは何か
  - Ruby の機能の一つ、関連するメソッドや定数をまとめたもの
    コードの再利用、名前空間の管理を助ける
    プログラムの構造を管理している
- クラスとの違いは何か

  - クラスはインスタンス化できるがモジュールはインスタンス化できない

  モジュールのみの特徴として、複数のモジュールを一つのクラスに取り込むことができる。(ミックスイン)

  これにより、クラスに機能を追加することができる。これはクラスにはない特徴です。

- モジュールを使うメリットは何か
  - モジュールにメソッドや定数を定義することで、
    それらを他のクラスやモジュールで簡単に利用することができる
    これにより、コードの重複を減らし、プログラムの保守性が向上する。
- まとめ
- 継承せず(継承できない場合とか)にメソッドを再利用できるのが強み！！！
  サンプルの例は継承だけで済むけど一様、モジュールの使い方のサンプルとして書いときます。

```ruby
# 鳴き声を説明するモジュールです.インスタンス変数をメソッド名被らないように！
module Purr
  def make_purr
    "#{name}が#{purr}と泣いている！！"
  end
end

# 動物を管理するクラスです
class Animal
  include Purr
  attr_reader :name, :purr

  def initialize(name:, purr:)
    @name = name
    @purr = purr
  end
end

# わんちゃんに関するクラスです
class Dog < Animal
  include Purr
  def initialize(name: 'ぽち', purr: 'わんわん')
    super(name: name, purr: purr)
  end
end

# 猫ちゃんに関するクラスです
class Cat < Animal
  include Purr
  def initialize(name: 'ミケ', purr: 'ニャーニャー')
    super(name: name, purr: purr)
  end
end

# 赤ちゃんに関するクラスです
class Baby < Animal
  include Purr
  def initialize(name: 'ここちゃん', purr: 'ふええええええ')
    super(name: name, purr: purr)
  end
end

dog = Dog.new
cat = Cat.new
baby = Baby.new

puts dog.make_purr
puts cat.make_purr
puts baby.make_purr

```
