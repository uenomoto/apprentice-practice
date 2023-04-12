# 条件分岐を使うことができる

# 1,比較 xよりyが大きければ「x > y」 xよりyが小さければ「x < y」 xとyの値が同じなら「x == y」

def greater(x, y)
  if x > y
    "#{x}より#{y}の方が小さい"
  elsif x < y
    "#{x}より#{y}の方が大きい"
  else
    '値は等しいです'
  end
end

puts greater(5, 4)
puts greater(-50, -40)
puts greater(1000, 1000)

# 2. 電車の料金
# 問題: 東京駅から新宿駅までJR山手線に乗って移動します。12歳以上は大人料金で200円、6歳以上12歳未満はこども料金で100円、
# 6歳未満は幼児で無料となります。年齢に応じて東京駅から新宿駅までの料金を出力する関数 train_fare を定義してください。

def train_fare(age)
  adult_fare = 200
  child_fare = 100
  infant_fare = 0

  if age >= 12
    adult_fare
  elsif age >= 6
    child_fare
  else
    infant_fare
  end
end

puts train_fare(12)
puts train_fare(6)
puts train_fare(5)

# 3.XOR
# 問題:2つのブーリアン値 x と y が与えられ、x と y のうちどちらかが真なら true を出力し、両方真もしくは両方偽なら false を出力する関数 xor を定義してください

# xとyが一致しなければtrueなので、xがyと等しくない場合に真を返す比較演算子
def xor(x, y)
  if x != y
    true
  else
    false
  end
end

puts xor(true, true)
puts xor(true, false)
puts xor(false, true)
puts xor(false, false)
