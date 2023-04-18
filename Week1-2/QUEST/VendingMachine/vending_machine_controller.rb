# 自販機購入時の処理管理専用のクラス
class VendingMachineController
  # サントリーの方はcup_managerないからnilで↓
  def initialize(vending_machine, cup_manager = nil)
    @vending_machine = vending_machine # ここにインスタンス作成した際に入れた引数が入る
    @cup_manager = cup_manager # カップ専用自販機のみカップの数管理
  end

  def vending_machine_course
    # ボスマート付き自販機
    drink_vending_machine = VendingMachine.new
    cola = Drink.new
    snack = Snack.new
    monsuta = Drink.new(name: 'モンスターエナジー', price: 300)
    natyan = Drink.new(name: 'なっちゃん', price: 100)
    iemon = Drink.new(name: 'いえもん', price: 150)
    ageone = Snack.new(name: '揚げ一番', price: 100)
  
    loop do
      puts 'お金を入れてください'
      price = gets.chomp.to_i
      price_result = drink_vending_machine.coin_in(price)
  
      break unless price_result == 'お金は100円,500円,1000円のみ投入可能です'
    end
  
    loop do # 継続購入させる
      puts '買いたいものを選んでください'
      drink_and_snacks = [cola, monsuta, natyan, iemon, snack, ageone]
      index = 0
      drink_and_snacks.each do |item|
        puts '--'
        puts "#{index + 1}:#{item.name}:値段#{item.price}円"
        index += 1
      end
  
      item_order = gets.chomp.to_i
  
      if item_order.between?(1, drink_and_snacks.length)
        selected_item = drink_and_snacks[item_order - 1]
        puts "お客様が選んだのは#{selected_item.name}です。"
        puts drink_vending_machine.press_button(selected_item)
  
        break if drink_vending_machine.balance < 100
  
        puts '継続して購入しますか？(Y/N)' # 100円以上あったら継続
        continue = gets.chomp.upcase
        break if continue == 'N'
      else
        puts '商品番号の範囲内で入力してください'
      end
    end
    puts 'ご利用ありがとうございました！'
  end

  def cup_only_vending_machine_course
    cup_manager = CupManager.new
    cup_only_vending_machine = CupOnlyVendingMachine.new(cup_manager: cup_manager)
    hot_coffee = CupCoffee.new
    cold_coffee = CupCoffee.new(name: '冷たいカップのコーヒー', price: 100)
    delicious_coffee = CupCoffee.new(name: '美味しいカップコーヒー', price: 150)
    high_class_coffee = CupCoffee.new(name: '高級カップコーヒー', price: 200)
  
    loop do
      puts 'お金を入れてください'
      price = gets.chomp.to_i
      deposit_result = cup_only_vending_machine.coin_in(price)
  
      break unless deposit_result == 'お金は100円,500円,1000円のみ投入可能です'
    end
  
    loop do
      puts 'カップを補充してください(お客さんが置くシステムde1~5個の間で置いてください)'
      add = gets.chomp.to_i
      add_cup_result = cup_manager.add_cup(add)
  
      break unless add_cup_result == '1~5個の間で補充してください'
    end
  
    loop do
      puts '買いたいものを選んでください'
      cup_items = [hot_coffee, cold_coffee, delicious_coffee, high_class_coffee]
      index = 0
      cup_items.each do |cup_item|
        puts '--'
        puts "#{index + 1}:#{cup_item.name}:値段#{cup_item.price}円"
        index += 1
      end
  
      cup_item_order = gets.chomp
  
      if cup_item_order =~ /^\d+$/ && cup_item_order.to_i.between?(1, cup_items.length)
        cup_item_order = cup_item_order.to_i
        selected_cup_item = cup_items[cup_item_order - 1]
        puts "お客様が選んだのは#{selected_cup_item.name}です。"
        puts cup_only_vending_machine.press_button(selected_cup_item)
  
        break if cup_only_vending_machine.balance < 100 || cup_manager.remaining_cups.zero?
  
        puts '継続して購入しますか？(Y/N)'
        continue = gets.chomp.upcase
        break if continue == 'N'
      else
        puts '商品番号の範囲内で入力してください'
      end
    end
    puts 'ご利用ありがとうございました！'
  end

  def dydo_vending_machine_course
    dydo_vending_machine = DydoVendingMachine.new
    blend = Drink.new(name: 'ブレンドコーヒー', price: 100)
    barista = Drink.new(name: 'バリスタ', price: 150)
    saraore = Drink.new(name: 'さらっとしぼったオレンジ', price: 150)
    black = Drink.new(name: 'ブラック樽', price: 100)
    blue = Drink.new(name: 'デミタス微糖', price: 100)
    loop do
      puts 'お金を入れてください'
      price = gets.chomp.to_i
      price_result = dydo_vending_machine.coin_in(price)
  
      break unless price_result == 'お金は100円,500円,1000円のみ投入可能です'
    end
  
    loop do # 継続購入させる
      puts '買いたいものを選んでください'
      dydo_drinks = [blend, barista, saraore, black, blue]
      index = 0
      dydo_drinks.each do |item|
        puts '--'
        puts "#{index + 1}:#{item.name}:値段#{item.price}円"
        index += 1
      end
  
      item_order = gets.chomp.to_i
  
      if item_order.between?(1, dydo_drinks.length)
        selected_item = dydo_drinks[item_order - 1]
        puts "お客様が選んだのは#{selected_item.name}です。"
        puts dydo_vending_machine.press_button(selected_item)
  
        break if dydo_vending_machine.balance < 100
  
        puts '継続して購入しますか？(Y/N)' # 100円以上あったら継続
        continue = gets.chomp.upcase
        break if continue == 'N'
      else
        puts '商品番号の範囲内で入力してください'
      end
    end
    puts 'ご利用ありがとうございました！'
  end
end
