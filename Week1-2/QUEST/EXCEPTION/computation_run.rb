require './calculation'

# 計算を実行するクラスです
class ComputationRun
  class << self
    def result(num1, num2, operator)
      # ここで計算方法クラス(と計算方法クラスの中にある計算機クラス)のインスタンスを作成！
      calculation = Calculation.new(num1: num1, num2: num2, operator: operator)

      result = calculation.selection
      puts ''
      puts "計算結果: #{num1}#{operator}#{num2} = #{result}"
    end

    def execute
      loop do
        num1, operator, num2 = user_input
        begin
          result(num1, num2, operator)
          exit_prompt = prompt('続けますか？(Y/N)')
          break if exit_prompt.upcase == 'N'
        rescue ZeroDivisionError => e
          puts e
        end
      end
    end

    private

    def prompt(message)
      print message
      gets.chomp
    end

    def user_input
      num1 = InputColumn.get_number('1番目の数値を入力してください: ')
      operator = InputColumn.get_operator('演算子(+, -, *, /)を入力してください: ')
      num2 = InputColumn.get_number('2番目の数値を入力してください: ')
      [num1, operator, num2]
    end
  end
end
