# ユーザー入力欄クラスです。
class InputColumn
  def self.get_input(description)
    print description
    gets.chomp
  end

  def self.get_number(description)
    loop do
      input = get_input(description)
      return input.to_f if input.match(/\A-?\d+(\.\d+)?\z/) # ガード節のあとは空行を

      raise NoNumberError
    rescue NoNumberError => e
      puts e
    end
  end

  def self.get_operator(description)
    loop do
      input = get_input(description)
      return input if ['+', '-', '*', '/'].include?(input)

      raise NoMatchOperatorError
    rescue NoMatchOperatorError => e
      puts e
    end
  end
end

