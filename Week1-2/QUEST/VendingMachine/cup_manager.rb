# カップの数を管理するクラスです。
class CupManager
  attr_reader :cup_count
  def initialize
    @cup_count = 0
  end

  def add_cup(count)
    # カップの数をmax100にする
    max_cup_count = 100
    # 100以下だったらカウントする
    if @cup_count + count <= max_cup_count
      @cup_count += count
    else
      # 100以上補充しても100で止まる
      @cup_count = max_cup_count
    end
    "増やした現在のカップの数: #{@cup_count}"
  end

  def down_cup
    if @cup_count.positive? # positive?メソッドは正の数時にtrueなる
      @cup_count -= 1
      true
    else
      false
    end
  end

  # 購入時にカップがあるかないかを確認するメソッド、購入時なので自販機クラスに渡す必要がある
  def cup_exists_empty(item_object)
    if item_object.is_a?(CupCoffee) && @cup_count > 0
      down_cup
      puts "残りのカップ数: #{@cup_count}"
    elsif item_object.is_a?(CupCoffee) && @cup_count <= 0
      "現在カップが切れてます。#{item_object.name}はカップを使う為購入できません。"
    end
  end
end
