require './participant'

# プレイヤー特有のアクション機能を管理するクラスです
class Player < Participant
  def initialize
    super()
    @hand = Hand.new
  end

  # カードを引くか引かないかを決めるメソッド
  def choose_action
    loop do
      puts "あなたの現在の得点は#{@total_score}です。カードを引きますか？（Y/N）"
      answer = gets.chomp
      break if answer.upcase == 'N'
    end
  end
end
