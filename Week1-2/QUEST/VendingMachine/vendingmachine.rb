require './drink'
require './cup_coffee'
require './snack'

# このクラスは自動販売機の機能を管理します。
class VendingMachine
  # 属性に販売機の中に入ってる合計金額とメーカー名を持たす
  attr_accessor :manufacturer_name, :total_price

  # イニシャライズメソッドでクラス.newされた直後に処理を実行することができる。(空のメーカー名と初期値０円を渡す)
  def initialize(manufacturer_name:)
    self.manufacturer_name = manufacturer_name
    self.total_price = 0
  end

  # 自動販売機のメーカー名を確認するメソッドだけど非公開だから見えない。
  def press_manufacturer_name
    manufacturer_name.to_s
  end

  # 自販機の中にある合計金額を数えるメソッド
  def deposit_coin(price)
    if price != 100
      '100円以外は受け付けません'
    else
      self.total_price += price
      "現在の自動販売機に入っている金額は#{total_price}円です"
    end
  end

  # 自販機のボタンを押して条件が合うと商品が買えて会わないと買えないメソッド
  def press_button(item_object)
    # 現在の金額が100未満だとtureになり100円入れろと怒られる
    if self.total_price < 100
      '100円を入れてください'
    # 100円入ってるけどコーラの150は足りないからtrueになり怒られる
    elsif self.total_price < item_object.price
      "#{item_object.name}を買おうとしてますが\n#{item_object.price - self.total_price}円足りません。"
      # カップ系分岐↓
    elsif cup_condition(item_object)
      cup_condition(item_object)
    else
      # 全て変える条件に達したら合計金額から商品の金額を引き算する
      self.total_price -= item_object.price
      "#{item_object.name}のお買い上げありがとうございました！\n現在の自販機内の金額#{total_price}円です"
    end
  end

  # カップコーヒー購入しようとした時のみ走るメソッド、カップの数を管理し減らしたりなかったら買えなくなる
  def cup_condition(item_object)
    # カップの数が0以下だったらtrueになって買えなくなる
    if item_object.is_a?(CupCoffee) && CupCoffee.cup_count <= 0
      "申し訳ありませんが、カップがないため#{item_object.name}を買えません。"

      # カップクラスを特定し、カップ買った時かつカップの数が０より多い２つの条件を満たした時のみカップの個数を減らす。
    elsif item_object.is_a?(CupCoffee) && CupCoffee.cup_count.positive?
      CupCoffee.down_cup
      # CupCoffeeクラスを直接呼ぶ場合、putsを入れる。
      puts "残りのカップ数: #{CupCoffee.cup_count}"
    end
  end

  # ↓ここから下にあるインスタンスメソッドは非公開メソッドとなる。
  private :press_manufacturer_name
end