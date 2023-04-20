# require 'debug/start'

# カードの得点を管理するクラスです(ステップ２からAが1点か11点になる)
class CardScore
  # 数字のカードの柄を管理するメソッドです
  def num_handle(handle)
    handles = { 'h' => 'ハート', 's' => 'スペード', 'c' => 'クローバー', 'd' => 'ダイヤ' }
    handles[handle]
  end

  # JQKカードの得点メソッド
  def illustration_scores(points, card)
    illustration_cards = { 'J' => 'ジョーカ', 'Q' => 'クイーン', 'K' => 'キング' }
    illustration_card = illustration_cards[card]
    "得点は#{illustration_card}の#{points}点です"
  end

  # 得点を表すメソッド
  def scores(points, handle)
    case points
    when 2..9
      "得点は#{num_handle(handle)}の#{points}点です"
    when 10
      illustration_scores(points, handle)
    end
  end

  # ランダムな得点と柄を生成するメソッド(出力結果はscoresの文章)
  def random_score
    points = rand(2..10)
    if points == 10
      # binding.break
      card = %w[J Q K].sample
      scores(points, card)
    else
      num_handle = %w[h s c d].sample
      scores(points, num_handle)
    end
  end
end

card_score = CardScore.new
puts card_score.random_score
