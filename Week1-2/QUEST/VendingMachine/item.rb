# 商品に関するクラスです
class Item
  attr_accessor :name, :price

  # イニシャライズメソッドでクラス.newされた直後に空で処理を実行することができる。(引数で代入できる)
  def initialize(name:, price:)
    self.name = name
    self.price = price
  end
end
