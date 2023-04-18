require './drink'
require './cup_coffee'
require './cup_manager'
require './snack'
# このクラスは自動販売機(Drink&Snack)の機能を管理します。
class VendingMachine
  # 属性に販売機の中に入ってる合計金額とメーカー名を持たす
  attr_reader :manufacturer_name, :total_price

  # イニシャライズメソッドでクラス.newされた直後に処理を実行することができる。(空のメーカー名と初期値０円を渡す)
  # 明示的にデフォルト値を設定する
  def initialize(manufacturer_name: 'サントリー')
    @manufacturer_name = manufacturer_name
    @total_price = 0
  end

  # 自動販売機のメーカー名(製造者名)を確認するメソッド
  def confirm_manufacturer_name
    manufacturer_name.to_s
  end

  # 自販機の中にある合計金額を数えて受付可能がどうかを条件分岐するメソッド
  def deposit_coin(price)
    # 配列に入れることにより柔軟に今後利用可能なコインが増せる
    array_coins = [100, 500, 1000]
    if array_coins.include?(price) # include?は配列の場合中身の値が合っていればtrueなければfalse。
      @total_price += price
      "#{@manufacturer_name}の自動販売機に入っている金額は#{@total_price}円です"
    else
      'お金は100円,500円,1000円のみ投入可能です'
    end
  end

  # deposit_coin出力専用とdeposit_coinメソッドでfalseを返したらリターンするメソッド
  def coin_in(price)
    deposit_result = deposit_coin(price)
    puts deposit_result
    deposit_result # ここでfalseの場合リターンしている
  end

  # お金が足りない時の条件分岐でboolean値なのでメソッドをメッセージと分ける
  def not_enough_money?(item_object)
    @total_price < item_object.price
  end

  # 金額が足りなかった時のメッセージメソッド
  def not_enough_money_message(item_object)
    "#{item_object.name}を買おうとしてますが\n#{item_object.price - @total_price}円足りません。"
  end

  # お金が足りた時の場合
  def enough_money(item_object)
    @total_price -= item_object.price
    "#{item_object.name}のお買い上げありがとうございました！\n現在の自販機内の金額#{@total_price}円です"
  end

  # 金額が足りるか足りないか確認メソッド
  def check_money_enough(item_object)
    not_enough_result = not_enough_money?(item_object)
    message = not_enough_money_message(item_object)

    if not_enough_result
      message
    else
      enough_money(item_object) # 条件分岐が増えると変数に入れると２回繰り返されてしまい挙動がおかしくなる
    end
  end

  # 自販機のボタンを押して金額が足りるか足りないかの条件分岐の出力結果用。
  def press_button(item_object)
    check_money_enough(item_object)
  end

  # 継続する際に使用する、残高確認メソッド
  def balance
    @total_price
  end
end
