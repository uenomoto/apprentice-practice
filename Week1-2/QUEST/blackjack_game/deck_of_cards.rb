require './card_score'

# 山札のカードの残枚数かつ何の柄の何の点数が残っているのかを管理するクラスです(全部で52枚)
class DeckOfCards
  attr_reader :card_count

  def initialize
    @card_count = deck_management # 山札の残枚数管理
  end

  # 山札管理：残枚数と柄点数全て管理 putsで呼ぶ際はdeck_managementで呼ぶと初期値だから引かれないため、card_countを呼ぶ！
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

  # draw_cardの一部、引いたカードを確認するためのメソッド
  def card_info(handle, point)
    "あなたの引いたカードは#{handle}の#{point}です。"
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

# deck = DeckOfCards.new
# puts deck.draw_card
# puts deck.card_count