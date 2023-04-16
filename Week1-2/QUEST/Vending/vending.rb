# 自動販売機に関するクラスです
class VendingMachine
  attr_accessor :manufacturer_name, :total_price, :cup_count

  def initialize(manufacturer_name:)
    @manufacturer_name = manufacturer_name
    @total_price = 0
    @cup_count = 0
  end

  # 押すと自販機のメーカー名がわかるメソッド
  def press_manufacturer_name
    @manufacturer_name
  end

  # 自販機のコイン投入口で100円しか受け付けないメソッド
  def deposit_coin(price)
    if price == 100
      @total_price += price
    else
      nil
    end
  end

  def add_cup(add)
    max_cup_count = 100
    if @cup_count + add <= max_cup_count
      @cup_count += add
    else
      @cup_count = max_cup_count
    end
    "#{@cup_count}です"
  end

  # カップコーヒー購入時のみ、カップを減らしカップがなかったら買えなくなるメソッド
  def cup_minus(item_object)
    if item_object.is_a?(CupCoffee) && @cup_count.positive?
      @cup_count -= 1
    elsif item_object.is_a?(CupCoffee) && @cup_count <= 0
      nil
    end
  end

  # 商品ボタンを押すと購入できて、条件に合わないと買えないメソッド
  def press_button(item_object)
    if @total_price < item_object.price
      nil
    else
      cup_minus(item_object)
      @total_price -= item_object.price
      item_object.name.to_s
    end
  end
  private :press_manufacturer_name
end

# 商品に関するメソッドです
class Item
  attr_accessor :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end
end

# 飲み物に関するクラスです
class Drink < Item
  def initialize(name:, price:)
    super(name: name, price: price)
  end
end

# カップコーヒーに関するメソッドです
class CupCoffee < Item
  def initialize(name:, price:)
    super(name: name, price: price)
  end
end

# スナック菓子に関するクラスです,ポリモーフィズム使用
class Snack < Item
  def initialize(name: 'ポテトチップス', price: 150)
    super(name: name, price: price)
  end
end

vending_machine = VendingMachine.new(manufacturer_name: 'サントリー')
cola = Drink.new(name: 'コーラ', price: 150)
cider= Drink.new(name: 'サイダー', price: 100)

hot_cup_coffee = CupCoffee.new(name: 'あついカップコーヒー', price: 100)
cold_cup_coffee = CupCoffee.new(name: '冷たいカップコーヒー', price: 100)

snack = Snack.new

puts vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
puts vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
puts vending_machine.press_button(hot_cup_coffee)
puts vending_machine.add_cup(1000)
puts vending_machine.deposit_coin(100)
puts vending_machine.deposit_coin(100)
puts vending_machine.press_button(hot_cup_coffee)
puts vending_machine.press_button(hot_cup_coffee)
puts vending_machine.add_cup(1)
puts vending_machine.deposit_coin(100)
puts vending_machine.press_button(snack)
# puts vending_machine.press_manufacturer_name
