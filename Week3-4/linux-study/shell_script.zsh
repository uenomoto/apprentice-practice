#!/bin/zsh

# Helloと出力、パーミッション気をつけて
echo 'Hello!'

# 標準入力から値を受け取る
echo 'What s your name?'
read name

echo "Welcome $name!"

# 条件分岐(計算機)
echo 'Enter two numbers:'
read num1
read num2

echo 'Choose an arithmetic operation (+, -, *, /):'
read operator

case $operator in
  '+')
  result=$(($num1 + $num2))
  echo "The result: $result"
  ;;
  '-')
  result=$(($num1 - $num2))
  echo "The result: $result"
  ;;
  '*')
  result=$(($num1 * $num2))
  echo "The result: $result"
  ;;
  '/')
  result=$(($num1 / $num2))
  echo "The result: $result"
  ;;
  *)
  echo "Error: 無効な演算子です"
  ;;
  esac

# 繰り返し処理
for ((i=2;i<=100;i+=2))
do
  echo -n "$i "
done
