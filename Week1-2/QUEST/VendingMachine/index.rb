# 出力結果を出す用と商品の一覧と名前(new)

# 外部ファイル呼び出し
require './vendingmachine'
require './drink'
require './cup_coffee'
require './cup_manager'
require './snack'

# newでインスタンス起動忘れずにじゃないとクラス内のインスタンスメソッドが使えない。
# CupManagerクラスを先に起動させないと動かないCupManagerクラスがないよと言われる
cup_manager = CupManager.new
vending_machine = VendingMachine.new(cup_manager: cup_manager)
cider = Drink.new
cola = Drink.new(name: 'cola', price: 150)
hot_cup_coffee = CupCoffee.new
cold_cup_coffee = CupCoffee.new(name: 'cold cup coffee', price: 100)
snack = Snack.new

puts vending_machine.press_button(snack)
puts vending_machine.coin_in(100)
puts vending_machine.coin_in(100)
puts vending_machine.coin_in(100)
puts vending_machine.coin_in(100)
puts vending_machine.coin_in(100)
puts vending_machine.coin_in(100)
puts vending_machine.coin_in(100)
puts vending_machine.coin_in(100)
puts vending_machine.coin_in(100)
puts vending_machine.coin_in(100)
puts cup_manager.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)
puts vending_machine.press_button(hot_cup_coffee)
puts vending_machine.press_button(cold_cup_coffee)
puts cup_manager.add_cup(2)
puts vending_machine.press_button(hot_cup_coffee)
puts vending_machine.press_button(cold_cup_coffee)
puts vending_machine.press_button(cider)
puts vending_machine.press_button(cola)
puts vending_machine.press_button(cola)
puts vending_machine.press_button(cola)
puts vending_machine.press_button(snack)
puts cup_manager.add_cup(150)
puts vending_machine.press_button(cola)
puts vending_machine.coin_in(100)
puts vending_machine.press_button(cola)
puts vending_machine.press_manufacturer_name
