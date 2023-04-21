require './hand'

# 参加者クラス、プレイヤーとディーラーを子クラスとして共通機能を書く
class Participant
  attr_reader :total_score

  # 初期値
  def initialize
    @total_score = 0
    @hand = Hand.new
  end

  # 手札の表示メソッド、こっちにプレイヤーの場合の表示
  def show_hand
    @hand.draw
  end

  # 得点の取得メソッド,引数持たせたら得点は取れた
  def calculate_score(card_info)
    point = CardScore.point_card_info(card_info, @total_score)
    @total_score += point
  end

  # 勝敗の結果メソッド
  def victory_or_defeat
    if @total_score < 21
      'かち'
    else
      '負け'
    end
  end
end

participant = Participant.new
card_info = participant.show_hand
# なぜ変数に入れているかというと、calculate_scoreメソッドに引数に入れたかったから
# ドローしたカードから、pointだけを抜き取ってそれをスコアとして計算している
puts card_info
puts participant.calculate_score(card_info)
puts card_info
puts participant.calculate_score(card_info)
