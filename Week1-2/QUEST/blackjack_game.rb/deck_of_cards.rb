require './card_score'

# 山札のカードの残枚数かつ何の柄の何の点数が残っているのかを管理するクラスです(全部で52枚)
class DeckOfCards
  attr_reader :card_count

  def initialize
    @card_count = deck_management
  end

  # 山札管理
  def deck_management
    handles = CardScore.handles
    points = CardScore.points

    handles.each_with_object({}) do |handle, card_count|
      points.each do |point|
        handle_name = CardScore.num_handle(handle)
        card_key = "#{handle_name}_#{point}"
        card_count[card_key] = 1
      end
    end
  end
  # ラファクダリングしました↑
  #   card_count = {}
  #   handles.each do |handle|
  #     points.each do |point|
  #       handle_name = CardScore.num_handle(handle)
  #       card_key = "#{handle_name}_#{point}"
  #       card_count[card_key] = 1
  #     end
  #   end
  #   card_count

  # 引いたカードを確認するためのメソッド
  def card_info(handle, point)
    "#{handle}の#{point}を引きました"
  end

  # ドローカード（カードを引く）
  def draw_card
    available_cards = @card_count.select { |_, count| count.positive? }
    return '山札はありません' if available_cards.empty?

    card_key = available_cards.keys.sample
    @card_count[card_key] -= 1
    handle, point = card_key.split('_')
    card_info(handle, point)
  end
end

dack = DeckOfCards.new
puts dack.card_count # 残りの山札表示
puts dack.draw_card # カードを引くと引いたカードを表示
puts dack.draw_card # カードを引くと引いたカードを表示
puts dack.draw_card # カードを引くと引いたカードを表示
puts dack.draw_card # カードを引くと引いたカードを表示
puts dack.card_count # ちゃんと引かれているか確認
