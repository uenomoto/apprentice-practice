# 変数を宣言し代入することができる
# 1. 三角形の面積
# 底辺が x cm、高さが y cmの三角形の面積を出力する関数 area を定義してください。
# 三角形の面積は底辺 * 高さ / 2である
# require 'debug/start'

def area(base, height)
  # binding.break
  result = base * height / 2
  "こちらの三角形の面積の答えは#{result}です"
end

puts area(5, 4)

t = 'EXCEPTION'
puts t.downcase
