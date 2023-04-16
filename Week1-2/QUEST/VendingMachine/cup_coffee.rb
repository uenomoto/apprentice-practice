require './item'

# カップコーヒーに関するクラスです。
class CupCoffee < Item
  # ↓カップクラス全体でカップを管理したいためクラス変数にするため
  @cup_count = 0
  def initialize(name:, price:)
    super(name: name, price: price)
  end

  # selfと入れることで、クラスメソッドになる。
  def self.add_cup(count)
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

  def self.down_cup
    if @cup_count.positive? # positive?メソッドは正の数時にtrueなる
      @cup_count -= 1
      true
    else
      false
    end
  end

  # cup_countをクラスメソッドとして使う
  def self.cup_count
    @cup_count
  end
end
