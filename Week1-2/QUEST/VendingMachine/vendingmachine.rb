require './drink'
require './cup_coffee'
require './cup_manager'
require './snack'
# このクラスは自動販売機の機能を管理します。
class VendingMachine
  # 属性に販売機の中に入ってる合計金額とメーカー名を持たす
  attr_reader :manufacturer_name, :total_price

  # イニシャライズメソッドでクラス.newされた直後に処理を実行することができる。(空のメーカー名と初期値０円を渡す)
  # 明示的にデフォルト値を設定する,ここに別のクラスのnewを入れるこれをコンポジションという↓
  def initialize(manufacturer_name: 'サントリー', cup_manager: CupManager.new)
    @manufacturer_name = manufacturer_name
    @total_price = 0
    @cup_manager = cup_manager # ここにはnew入れない入れると、VendingMachineクラス内でCupManagerクラスのインスタンスを作成してしまい別のインスタンス渡すためいくらカップを増やしても
    # Vendingクラス内では反映されない為カップがあるのに買えないバグが起きる
    # コンポジションのお陰でCupManagerクラスにあるメソッド、cup_exists_emptyメソッドがVendingMachineメソッドで使える。
  end

  # 自動販売機のメーカー名を確認するメソッドだけど非公開だから見えない。
  def press_manufacturer_name
    manufacturer_name.to_s
  end

  # 自販機の中にある合計金額を数えるて条件分岐するメソッド
  def deposit_coin(price)
    if price != 100
      '100円以外は受け付けません'
    else
      @total_price += price
      "現在の自動販売機に入っている金額は#{@total_price}円です"
    end
  end

  # deposit_coin出力専用
  def coin_in(price)
    deposit_coin(price)
  end

  # お金が足りない時の条件分岐
  def not_enough_money(item_object)
    # 現在の金額が100未満だとtureになり100円入れろと怒られる
    if @total_price < 100
      '100円を入れてください'
    # 100円入ってるけどコーラの150は足りないからtrueになり怒られる
    elsif @total_price < item_object.price
      "#{item_object.name}を買おうとしてますが\n#{item_object.price - @total_price}円足りません。"
    end
  end

  # お金が足りた時の場合
  def enough_money(item_object)
    # 全て変える条件に達したら合計金額から商品の金額を引き算する
    @total_price -= item_object.price
    "#{item_object.name}のお買い上げありがとうございました！\n現在の自販機内の金額#{total_price}円です"
  end

  # カップ個数確認メソッド、cup_managerクラスから持ってきてる
  def cup_condition(item_object)
    @cup_manager.cup_exists_empty(item_object)
  end

  # 自販機のボタンを押して条件が合うと商品が買えて会わないと買えない条件分岐メソッド
  # 購入する際にカップの数を確認するのでCupManagerクラスとは避けられない依存関係である。
  # コンポジションのおかげで最小限に抑えることできている
  def press_button(item_object)
    not_enough_result = not_enough_money(item_object)
    cup_condition_result = cup_condition(item_object)
    if not_enough_result
      not_enough_result
    elsif cup_condition_result
      cup_condition_result
    else
      enough_money(item_object)
    end
  end
  # ↓ここから下にあるインスタンスメソッドは非公開メソッドとなる。
  private :press_manufacturer_name
end
