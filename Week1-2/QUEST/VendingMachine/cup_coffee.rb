require './item'

# カップコーヒーの商品に関するクラスです。
class CupCoffee < Item
  def initialize(name: 'あったかいカップのコーヒー', price: 100)
    super(name: name, price: price)
  end
end
