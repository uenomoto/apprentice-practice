require './participant'

# ディーラー特有の機能を管理するクラスです
class Dealer < Participant
  def initialize
    super()
    @hand = Hand.new
  end

  # 17点以下まで継続させてカードを引かせるメソッド
  def choose_action

  end

  # 手札の表示メソッドこっちにオーバーライドにて、ディーラーの場合の表示方法
  def show_hand
  
  end
end
