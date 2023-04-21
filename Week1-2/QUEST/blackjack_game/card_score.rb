# require 'debug'

# カードの柄、得点を管理するクラスです(ステップ２からAが1点か11点になる)
class CardScore
  class << self
    # ノーマルの柄を管理するメソッドです
    def num_handle(handle)
      handles = { 'h' => 'ハート', 's' => 'スペード', 'c' => 'クローバー', 'd' => 'ダイヤ' }
      handles[handle]
    end
    
    # エースのカードに関するメソッド(1点)
    def ace_handle(handle:, points:, ace_handle:)
      ace_handles = { 'A' => 'エース' }
      ace_handle = ace_handles[ace_handle]
      "カードは#{num_handle(handle)}の#{ace_handle}:#{points}点です"
    end

    # JQKカードのメソッド(10点)
    def jqk_handle(points:, jqk_handle:, handle:)
      jqk_handle_cards = { 'J' => 'ジャック', 'Q' => 'クイーン', 'K' => 'キング' }
      jqk_handle_card = jqk_handle_cards[jqk_handle]
      "カードは#{num_handle(handle)}の#{jqk_handle_card}:#{points}点です" # #{num_handle(handle)}がnilになってしまう
      # 原因引数の順番が違くてだめになるキーワード引数にしてみた！
    end

    # 山札クラスに得点とJQKAを提供(JQKAこれらは、数字ではなく数字の様な柄なのでこっち)
    # なぜここに書くのかは今後カードの柄が増えても、(ジョーカ)カード関係のこのクラスを変えればいいようにここで書いてます。
    def points
      (1..10).to_a + %w[J Q K A]
    end

    # 山札クラスとrandom_scoreに渡す。それぞれの柄に(1..10)の数字と数字の柄(JQKAがある)
    def handles
      %w[h s c d]
    end

    # 得点を表すメソッド
    # jqk_handleの引数は空欄の場合もあるよと教えてあげると引数エラーは消えます
    def scores(points:, handle:, jqk_handle: nil, ace_handle: nil)
      case points
      when 1
        ace_handle = %w[A].sample
        ace_handle(handle: handle, points: points, ace_handle: ace_handle)
      when 2..9
        "カードは#{num_handle(handle)}:#{points}点です"
      when 10
        jqk_handle = %w[J Q K].sample
        jqk_handle(points: 10, jqk_handle: jqk_handle, handle: handle)
      end
    end

    # 得点のみを取得するメソッド
    def point_card_info(card_info, total_score)
      # カード情報の文字列から得点とJQKAを抽出する正規表現パターン
      point_pattern = /(?<=の)(\d+|[JQKA])/
      match_data = card_info.match(point_pattern)
      point = match_data[0]
      
      # 抜き出した文字列の数字を計算したいため整数に変更している
      point = if point.to_i.to_s == point # 数字の場合
                point.to_i # 入ってきた数字がそのまま得点となる
              elsif point == 'A'
                total_score <= 10 ? 11 : 1 # エースの場合のみ基本11点で合計が10超えてると1点となる
              else # J, Q, K の場合10点
                10
              end
      point
    end

    # ランダムde得点と柄を紐付けるメソッド(出力結果はscoresの文章)
    def random_score
      points = rand(1..10)
      handle = handles.sample
      if points == 10
        jqk_handle = %w[J Q K].sample
        scores(points: points, jqk_handle: jqk_handle, handle: handle)
      elsif points == 1
        ace_handle = %w[A].sample
        scores(points: points, handle: handle, ace_handle: ace_handle)
      else
        scores(points: points, handle: handle)
      end
    end
  end
end

# puts CardScore.random_score