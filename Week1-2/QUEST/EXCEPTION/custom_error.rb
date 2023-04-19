# エラークラス、カスタムエラーにするにはこのようにStandardErrorクラスから継承してを作らなければならない
class NoNumberError < StandardError
  def initialize
    super('num1とnum2は数値を入力してください、空欄も許可されていません')
  end
end

# エラークラス、StandardErrorを継承している為エラーメッセージを直接指定することも可能
# もちろん自分でメソッド(例えば：message)作ってputsで出力も可能
class NoMatchOperatorError < StandardError
  def initialize
    super('演算子には  +、-、*、/ のいずれかを使用してください')
  end
end
