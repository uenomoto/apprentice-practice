# 山札のカードの残枚数を管理するクラスです(全部で52枚)
class DeckOfCards
  attr_reader :card_count

  def initialize(card_count:)
    @card_count = card_count
  end
end