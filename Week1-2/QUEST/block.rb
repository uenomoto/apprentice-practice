# ブロックを使った配列の処理ができる
# 1. each
# 従業員の名前がID順に配列で渡されるので、IDと従業員の名前をセットにして出力する
# print_names 関数を定義してください。なお、each メソッドと with_index メソッドを使うようにしてください。

def print_names(names)
  names.each.with_index do |name, index|
    puts "#{index + 1}. #{name}"
  end
end

print_names(['上田', '上野', '上原'])

puts '-----------------------------'
# 2.map
# 与えられた整数の配列の要素を2乗した配列を返す square 関数を定義してください。なお、map メソッドを使うようにしてください。

def square(numbers)
  numbers.map { |n| n ** 2 } # **←これで２乗になる！
end

# squared_numbers変数に関数の配列にした引数を代入
squared_numbers = square([5, 7, 10])
# 新しく配列を作り、↓のsquared_numbersには元の配列の各要素を2乗したものが格納される。%が邪魔なのでpメソッドを使いました。
p squared_numbers

puts '-----------------------------'

# 3. select
# 整数の配列から偶数を抽出した配列を返す関数 select_even_numbers を作成してください。なお、select メソッドを使うようにしてください。
# selectメソッド初めてきいた。JSのfilter関数と一緒、配列の中から条件にあった値だけ出力することができる。

# 引数の代入された数字を偶数だけ出力することができる関数 even？は整数が偶数であるかどうかを判断するメソッド
def select_even_numbers(numbers)
  # ロボコップに怒られて気づきましたこの様に書くとシンプルに書けます
  numbers.select(&:even?)
  # numbers.select { |n| n.even? }これが↑になる
end

even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
p even_numbers
