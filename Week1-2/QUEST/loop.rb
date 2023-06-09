# 繰り返し処理

# 1. 挨拶
# 問題: 100回 "こんにちは！" と出力する関数 hello を定義してください。

# 100回数えるのも大変なのでeach文の引数にindex番号入れました。
def hello
  (1..100).each do |index|
    puts "#{index}: こんにちは"
  end
end
hello
puts '--------------------'

# 2.羊の問題
# あなたは眠れなくなったので羊の数を数えることにしました。羊の数 n が与えられ
# 羊が1匹 羊が2匹 羊が3匹 ...
# と、n 回羊の数えを出力する関数 sheep を定義してください。

def sheep(n)
  (1..n).each do |i|
    puts "羊が#{i}匹"
  end
end
sheep(3)

puts '--------------------'
# 初めてみたメソッドなので書いてみました。
def sheep2(n)
  n.times do |i|
    puts "羊が#{i + 1}匹"
  end
end
sheep2(5)

puts '--------------------'

# 3.総和
# 問題:1から100 までの足し算の結果を出力する関数 sum_1_100 を定義してください。

def sum_1_100
  result = 0 # 初期値0
  # 今回は1から100までなのでこのように範囲を決めて繰り返し処理を行う。
  (1..100).each do |i|
    # 最初にresult = 0 + 1→resultは1になる、次の繰り返しでresult = 1 + 2でresultは3になる、因みにiは１ずつ増えるので2になる
    # ３回目の繰り返しで、result = 3 + 3→result = 6 + 4でsumは10になる、このような繰り返しで最終的にresultは5050になる
    result += i
  end
  # 足し算の結果を返す
  result
end
puts sum_1_100

# sumメソッド使うとこんな簡単にできたwww
def sum_1_100_2
  (1..100).sum
end

puts sum_1_100_2

puts '--------------------'

# 4.総和
# 2つの整数 x と y が与えられ、x から y までの足し算の結果を出力する関数 sum を定義してください。

# 範囲を自分でxからyと決めれる様にしただけ
def sum(x, y)
  result = 0 # まずは結果を初期値に
  # each文の変数にincrementのiとするあとは３の総和と一緒の動き
  (x..y).each do |i|
    result += i
  end
  result
end
# 10から80の間で足し算
puts sum(10, 80)

puts '--------------------'

# 5.フィボナッチ数列(advanced)
# 家のお手伝いを毎日継続すると、継続日数 n 日に応じて、その日にもらえるお小遣いの金額が増えていきます。
# お小遣いの金額は以下の条件に従ってもらうことができます。
# f(0) = 0 円 f(1) = 1 円 f(n) = f(n-1) + f(n-2) 円 (n ≧ 2)整数 n に対して、n 日間お手伝いを継続した時の
# お小遣いの金額を算出する関数 fibonacci を定義してください。

# 条件として継続が0日の場合0円、1日の場合1円、２日以上継続できたら、f(n)=f(n-1)+f(n-2) 円このように繰り返されて増えていく

def fibonacci(n)
  return 0 if n == 0 # nが0の場合、0を返す
  return 1 if n == 1 # nが1の場合、1を返す

  # 変数fに、フィボナッチ数列を格納する配列を用意し、初期値として0と1を設定
  f = [0, 1]

  # 2日目から金額が増えていくので、2日目からn日目までの範囲で繰り返し処理を行う
  (2..n).each do |i|
    # i番目のフィボナッチ数は、(i-1)番目(昨日)と(i-2)番目(一昨日)のフィボナッチ数の足し算
    f[i] = f[i - 1] + f[i - 2]
  end
  f[n] # 最後に、n日目のフィボナッチ数つまり、お手伝いをn日継続した時のお小遣いの金額を返す
end

puts fibonacci(0)
puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(7)
puts fibonacci(30)

# フィボナッチ数列難しかったため再度言葉に残します
# f(n) = f(n-1) + f(n-2) 円、 (n ≧ 2)←これらを日本語に直します
# 2日目以上継続した場合このような計算になる、n日は昨日の金額と一昨日の金額合わせた金額がn日目の金額になります。
# f(0)=0円、f(1)=1円これは↓
# 継続していなければ0円、1日目だと1円。
# 二日目の場合、昨日の金額が1円で一昨日が0円なので1円。
# 三日目の場合、昨日が1円で一昨日が1円なので2円
# 四日目の場合、昨日が2円で一昨日が1円なので3円
# 五日目の場合、昨日が3円で一昨日が2円なので5円とこの様に増えていく
# f(2) = f(1) + f(0) = 1 + 0 = 1 円
# f(3) = f(2) + f(1) = 1 + 1 = 2 円
# f(4) = f(3) + f(2) = 2 + 1 = 3 円
# f(5) = f(4) + f(3) = 3 + 2 = 5 円
# f(6) = f(5) + f(4) = 5 + 3 = 8 円
# f(7) = f(6) + f(5) = 8 + 5 = 13 円
# 関数の計算通りに書くとこんな感じになる。

# 結果を可視化すると[0, 1, 1, 2, 3, 13, 832040]になる
