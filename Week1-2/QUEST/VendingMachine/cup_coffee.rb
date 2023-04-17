require './item'

# カップコーヒーの商品に関するクラスです。
class CupCoffee < Item
  def initialize(name: 'hot cup coffee', price: 100)
    super(name: name, price: price)
  end
end
