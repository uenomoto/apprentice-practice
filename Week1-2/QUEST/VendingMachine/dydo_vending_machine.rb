require './vendingmachine'

# ダイドーの自販機のクラスです
class DydoVendingMachine < VendingMachine
  def initialize(manufacturer_name: 'ダイドー')
    super(manufacturer_name: manufacturer_name)
  end
  # 残りの機能（メソッド）はVendingMachineクラスから継承している
end
