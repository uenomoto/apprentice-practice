require './item'

# 飲み物に関するクラスです。
class Drink < Item
  def initialize(name: 'cider', price: 100)
    super(name: name, price: price)
  end
end
