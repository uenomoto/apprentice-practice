# 出力結果を出す用と商品の一覧と名前(new)

# 外部ファイル呼び出し
require './drink'
require './cup_coffee'
require './vendingmachine'

vending_machine = VendingMachine.new(manufacturer_name: 'サントリー')

cider = Drink.new(name: 'cider', price: 100)
cola = Drink.new(name: 'cola', price: 150)

hot_cup_coffee = CupCoffee.new(name: 'hot cup coffee', price: 100)
cold_cup_coffee = CupCoffee.new(name: 'cold cup coffee', price: 100)

# puts vending_machine.deposit_coin(100)
# puts hot_cup_coffee.add_cup(1)
# puts vending_machine.press_button(hot_cup_coffee)
# puts vending_machine.deposit_coin(100)
# puts vending_machine.deposit_coin(100)
# puts vending_machine.deposit_coin(100)
# puts vending_machine.press_button(cider)
# # puts vending_machine.press_button(cola)
# puts vending_machine.deposit_coin(100)
# puts hot_cup_coffee.add_cup(10)
# puts vending_machine.press_button(hot_cup_coffee)
# puts vending_machine.press_manufacturer_name