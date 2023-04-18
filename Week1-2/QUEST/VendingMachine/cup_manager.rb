# カップの数を管理するクラスです。
class CupManager
  attr_reader :cup_count

  def initialize
    @cup_count = 0
  end

  def add_cup(count)
    # ガード節を使用しリファクタリング↓
    # if count.between?(1, max_cup_count) 
    #   @cup_count += count
    # else
    #   return '1~5個の間で補充してください'
    # end
    # "増やした現在のカップの数: #{@cup_count}"
    
    # カップの数をmax5個にする
    max_cup_count = 5

    # add_cupの引数が1~5の範囲でbetween?は1から5までの範囲を決めています。
    return '1~5個の間で補充してください' unless count.between?(1, max_cup_count)

    @cup_count += count
    "増やした現在のカップの数: #{@cup_count}"
  end

  def down_cup
    @cup_count -= 1
  end

  def remaining_cups
    @cup_count
  end

  # 購入時にカップがあるかないかを確認するメソッド、購入時なのでカップ専用自販機クラスに渡す必要がある
  def cup_exists_empty(item_object)
    if item_object.is_a?(CupCoffee) && @cup_count.positive?
      down_cup
      puts "残りのカップ数: #{@cup_count}"
    elsif item_object.is_a?(CupCoffee) && @cup_count <= 0
      "現在カップが切れてます。#{item_object.name}はカップを使う為購入補充してください。"
    end
  end
end
