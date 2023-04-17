require './item'

# スナック菓子に関するクラスです
class Snack < Item
  def initialize(name: 'potato chips', price: 150)
    super(name: name, price: price)
  end
end
