# ユーザー入力欄クラスです。
class InputColumn
  def self.get_input(description)
    print description
    gets.chomp
  end

  def self.get_number(description)
    loop do
      input = get_input(description)
      # ガード節を使い 入力検証バリテーションチェック！
      # /\A-?\d+(\.\d+)?\z/は入力が整数または小数点がマッチするかどうかをチェックする正規表現。
      # (要するにそれ以外はマッチしないのでNoNumberErrorが出る)
      return input.to_f if input.match(/\A-?\d+(\.\d+)?\z/) # ガード節のあとは空行を

      raise NoNumberError
    rescue NoNumberError => e
      puts e
    end
  end

  def self.get_operator(description)
    loop do
      input = get_input(description)
      # inputで渡ってきた値が'+', '-', '*', '/'いずれかであればloopを抜けることができる。
      # それ以外はNoMatchOperatorErrorが出る
      return input if ['+', '-', '*', '/'].include?(input) # returnとbreakの違いについて調べる

      raise NoMatchOperatorError
    rescue NoMatchOperatorError => e
      puts e
    end
  end
end
# なぜputsではなくprintかは改行が無いため横に入力が出るため、putsは自動で改行されます。
# ユーザーにとって見やすいインターフェイスを心掛けましょう！

# さてさてここで疑問が一つ生まれました。
# InputColumnクラスのget_inputクラスメソッドはこのクラスでしか使われておりません！
# なぜプライベートにしないのか？
# 今後再利用できる可能性が大いにあるからです。
# get_inputクラスメソッドはただ単に入力を受けるだけのメソッドです。これから計算機だけでなく他の機能で使えそうです
# 他のクラスでも再利用する可能性があるため、プライベートにしない方がいいと私は思いました。
# これがもしこのクラス内だけに特化したメソッドで再利用することが考えにくい場合、privateメソッドにした方が良いでしょう。
