# 変数を宣言し代入することができる
# 1. 三角形の面積
# 底辺が x cm、高さが y cmの三角形の面積を出力する関数 area を定義してください。
# 三角形の面積は底辺 * 高さ / 2である

def area(base, height)
  puts "こちらの三角形の面積の答えは#{base * height / 2}です"
end

area(5, 4)

t = "OBJECT_ORIENTED_DEVELOPMENT"
puts t.downcase
