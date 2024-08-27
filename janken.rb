# ただテキストでじゃんけんをするだけ

puts "じゃんけん！"
puts "グー：1, チョキ：2, パー：3"
player = gets.to_i # 数字を入力
npc = rand(1..3).to_i # 1~3をランダムに決める

# 各条件ごとに勝敗を出力
if player == 1 && npc == 2
  puts "プレイヤーの勝ち"
elsif player == 1 && npc == 3
  puts "あいての勝ち"
elsif player == 2 && npc == 1
  puts "あいての勝ち"
elsif player == 2 && npc == 3
  puts "プレイヤーの勝ち"
elsif player == 3 && npc == 1
  puts "プレイヤーの勝ち"
elsif player == 3 && npc == 2
  puts "あいての勝ち"
elsif player == npc
  puts "あいこ"
end