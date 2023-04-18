# プロセスはここから始まります。

# 外部ファイル呼び出し
require './vending_machine_controller'
require './cup_manager'
require './cup_only_vending_machine'
require './vendingmachine'
require './dydo_vending_machine'
require './drink'
require './cup_coffee'
require './snack'

cup_manager = CupManager.new
cup_only_vending_machine = CupOnlyVendingMachine.new(cup_manager: cup_manager)
drink_vending_machine = VendingMachine.new
dydo_drink_machine = DydoVendingMachine.new

# selected_vending_machineが未定義とエラーが出た。
# selected_vending_machineはif文の中に入っているため参照ができないため、外側で空のselected_vending_machine
# 変数を用意しておくことで未定義エラーを回避できます。
selected_vending_machine = nil

loop do
  vending_machines = [cup_only_vending_machine, drink_vending_machine, dydo_drink_machine]
  puts '自動販売機コーナー！購入したい方を選んでね！'
  index = 0
  vending_machines.each do |vending_machine|
    puts "#{index + 1}: #{vending_machine.manufacturer_name}"
    index += 1
  end

  vending_machine_select = gets.chomp

  if vending_machine_select =~ /^\d+$/ && vending_machine_select.to_i.between?(1, vending_machines.length)
    vending_machine_select = vending_machine_select.to_i
    selected_vending_machine = vending_machines[vending_machine_select - 1]
    puts "お客様が選んだのは#{selected_vending_machine.manufacturer_name}です。"
    break # 成功したらループから抜け出す
  else
    puts '表示番号の範囲内で選択してください' # falseならループする。
  end
end

# ここの段階で上で作った空のselected_vending_machine変数にユーザーが選んだ番号が入って参照できます。
case selected_vending_machine.manufacturer_name
when 'サントリー'
  controller = VendingMachineController.new(drink_vending_machine) # サントリー選んだ時のみインスタンス作成！
  controller.vending_machine_course
when 'コカコーラ(カップ機)'
  controller = VendingMachineController.new(cup_only_vending_machine, cup_manager)
  controller.cup_only_vending_machine_course
when 'ダイドー'
  controller = VendingMachineController.new(dydo_drink_machine) # サントリー選んだ時のみインスタンス作成！
  controller.dydo_vending_machine_course
end
