require './calculation'
require './custom_error'

# ユーザーが電卓を続けるか続けないかの選択肢を作るプロンプト
def prompt(message)
  print message
  gets.chomp
end

# なぜputsではなくprintかは改行が無いため横に入力が出るため、putsは自動で改行されます。
# ユーザーにとって見やすいインターフェイスを心掛けましょう！

# 4/20にここからリファくだリングかつクラス外ではインスタンス変数使わないようにする！
loop do
  # 先にチェックなしの入力をここで決める
  print '1番目の整数を入力してください: '
  input1 = gets.chomp
  print '2番目の整数を入力してください: '
  input2 = gets.chomp
  puts '演算子(+, -, *, /)を入力してください'
  @operator = gets.chomp
  begin
    # ガード節を使い 入力検証バリテーションチェック！
    # /[^0-9.]/は入力が数値または小数点以外の文字を含むかどうかをチェックする正規表現と空欄を許可しない。
    no_number_error = NoNumberError.new
    raise no_number_error if input1.empty? || input2.empty? ||
                          !(input1.match(/\A-?\d+(\.\d+)?\z/)) ||
                          !(input2.match(/\A-?\d+(\.\d+)?\z/))
    
    raise NoMatchOperatorError unless ['+', '-', '*', '/'].include?(@operator)
    
    # 先ほどのinput1,input2をバリデーションを通して、厳重チェック
    @num1 = input1.to_f
    @num2 = input2.to_f

    calculation = Calculation.new(num1: @num1, num2: @num2, operator: @operator) # インスタンス作成は最後

    result = calculation.selection
    puts ''
    puts "計算結果: #{@num1}#{@operator}#{@num2} = #{result}"
    exit_prompt = prompt('続けますか？(Y/N)')
    break if exit_prompt.upcase == 'N'
  rescue ZeroDivisionError => e
    puts e
  rescue NoNumberError => e
    puts e
  rescue NoMatchOperatorError => e
    puts e
  end
end
