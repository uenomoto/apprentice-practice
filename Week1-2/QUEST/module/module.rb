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
