require './calculator'

# 計算方法を決めるクラスです
class Calculation
  def initialize(num1:, num2:, operator:)
    @calculator = Calculator.new(num1: num1, num2: num2)
    @operator = operator
  end

  # 引数operatorに入る四則演算が＋だったらCalculatorクラスのaddメソッドが実行される
  def selection
    case @operator
    when '+'
      @calculator.add
    when '-'
      @calculator.subtract
    when '*'
      @calculator.multiply
    when '/'
      @calculator.divide
    end
  end
end