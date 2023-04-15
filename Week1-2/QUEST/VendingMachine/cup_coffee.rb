require './item'

# カップコーヒーに関するクラスです。
class CupCoffee < Item
  attr_accessor :count

  def initialize(name:, price:)
    super(name: name, price: price)
    self.count = 0
  end

  def add_cup(count)
    # カップの数が100超えないようにする↓
    self.count += count
    if self.count <= 100
      "現在のカップの数: #{self.count}"
    else
      'カップはストック100までです'
    end
  end

  def down_cup
    if count.positive? # positive?メソッドは正の数時にtrueなる
      self.count -= 1
      true
    else
      false
    end
  end
end
