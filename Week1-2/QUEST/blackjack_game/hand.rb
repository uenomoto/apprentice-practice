require './deck_of_cards'

# 手札を管理して、手札を引く機能と合計点数決めるクラスです。
class Hand
  def initialize
    @card_deck = DeckOfCards.new # 山札の残枚数を管理していてそこからドローさせる
  end

  # カードを引いたものを確認するメソッド,インスタンスメソッドのためインスタンス変数で
  def draw
    @card_deck.draw_card
  end

  # 手札の合計得点を計算するメソッド
  def calculate_score

  end
end
