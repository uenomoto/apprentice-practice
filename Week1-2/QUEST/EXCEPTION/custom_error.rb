# エラークラス、カスタムエラーにするにはこのようにStandardErrorクラスから継承してを作らなければならない
class NoNumberError < StandardError
  def initialize
    super('num1とnum2は数値を入力してください、空欄も許可されていません')
  end
end
# エラークラス
class NoMatchOperatorError < StandardError
  def initialize
    super('演算子には  +、-、*、/ のいずれかを使用してください')
  end
end
