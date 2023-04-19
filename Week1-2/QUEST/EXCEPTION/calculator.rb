# 計算機クラスで計算方法をそれぞれのメソッドに入れてます
class Calculator
  def initialize(num1:, num2:)
    @num1 = num1
    @num2 = num2
  end

  def add
    @num1 + @num2
  end

  def subtract
    @num1 - @num2
  end

  def multiply
    @num1 * @num2
  end

  def divide
    raise ZeroDivisionError, 'ゼロによる割り算は許可されていません' if @num2.zero? # ガード節

    @num1 / @num2
  end
end
