#2.両替 
# 引数として金額、変換元の通貨、変換先の通貨を受け取り、変換後の金額を出力する両替関数を作成します。
# まず、米ドル（USD）に対するさまざまな通貨の換算率を格納した conversion_rates というハッシュを作成してください。
# キーに通貨名をシンボルで指定し、値には通貨の換算率を数値で格納してください。
# 次に、金額、変換元の通貨、変換先の通貨、返還率を受け取り、変換後の金額を出力する convert_currency 関数を作成してください

# 変換後の金額が１ドルが110円とした場合↓
conversion_rates = { usd: 1.0, jpy: 110.0, eur: 0.8 }

def convert_currency(amount, source_currency, target_currency, conversion_rates)
  # 変換元のレートをsource_rateとしconversion_ratesのハッシュから値を取り出している
  source_rate = conversion_rates[source_currency]
  # 変換先のレートをtarget_rateとしconversion_ratesのハッシュから値を取り出している
  target_rate = conversion_rates[target_currency]
  # 返還率(レート)の計算
  amount / source_rate * target_rate
end

# 100ドルを日本円変換した金額11000円が出力される
puts convert_currency(100, :usd, :jpy, conversion_rates)




# 計算系苦手な為まとめ

# convert_currency関数(レート変換する関数)には4つの引数がある

# amount: 変換する金額
# source_currency: 変換元の通貨
# target_currency: 変換先の通貨
# conversion_rates: 通貨の変換レートが格納されたハッシュ
# 関数内では、変換元の通貨のレートをsource_rateに、変換先の通貨のレートをtarget_rateに格納します。
# その後、金額(amount)を変換元のレートで割り、変換先のレートで掛けることで、変換後の金額を計算。

# この例では、以下の変換レート
# 1ドル (USD) = 1.0
# 1ユーロ (EUR) = 0.8
# 1日本円 (JPY) = 110.0

# ここの部分↓が本当に意味がわかんなかった為言葉化して理解してみる。
# なぜハッシュの値を取り出しているのか

# source_rateを変換元(source_currency)としtarget_rateを変換先(target_currency)と区別する必要がある↓

# source_rate = conversion_rates[source_currency]
# target_rate = conversion_rates[target_currency]

# ↓引数の順番通りに並べること！そうすると、amountは100ドルで、conversion_ratesは関数内でハッシュの値を取り出すためにある
# source_currencyが:usdになる、conversion_rates[:usd]は1.0を返し、source_rateに1.0が格納される。
# target_currencyが:jpyになる、conversion_rates[:jpy]は110.0を返し、target_rateに110.0が格納される。

# amount / source_rate * target_rate
# よって計算は、100 / 1.0 * 110.0になり、答えは11000.0になる

# puts convert_currency(100, :usd, :jpy, conversion_rates)




# コードまとめ↓
# def convert_currency(amount, source_currency, target_currency, conversion_rates)
#   source_rate = conversion_rates[source_currency]
#   target_rate = conversion_rates[target_currency]
#   amount / source_rate * target_rate
# end
# conversion_rates = { usd: 1.0, jpy: 110.0, eur: 0.8 }
# puts convert_currency(100, :usd, :jpy, conversion_rates)
