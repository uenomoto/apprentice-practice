require './vendingmachine'

# カップ専用自販機に関するクラスです。自販機クラスの属性とメソッド使いたいので継承します。
class CupOnlyVendingMachine < VendingMachine
  # ここに別のクラスのnewを入れるこれをコンポジションという↓
  def initialize(manufacturer_name: 'コカコーラ(カップ機)', cup_manager: CupManager.new)
    super(manufacturer_name: manufacturer_name)
    @cup_manager = cup_manager
  end

  # カップ個数確認、cup_exists_emptyメソッドはcup_managerクラスから持ってきてる
  # コンポジションのおかげで依存関係を最小限に抑えることできている
  def cup_condition(item_object)
    @cup_manager.cup_exists_empty(item_object)
  end

  # カップ自販機のみカップの残数確認機能を追加
  def check_money_enough(item_object)
    not_enough_result = not_enough_money?(item_object)
    if not_enough_result
      not_enough_money_message(item_object)
    elsif cup_condition(item_object)
      cup_condition(item_object)
    else
      enough_money(item_object) # 変数に入れると挙動がうまくいかないwhy!？
    end
  end
  # 残りの機能（メソッド）はVendingMachineクラスからオーバーライドで継承している
end
