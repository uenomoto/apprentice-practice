require './item'

# 飲み物に関するクラスです。
class Drink < Item
  def initialize(name:, price:)
    super(name: name, price: price)
  end
end
