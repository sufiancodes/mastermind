class Board
  @@store_code = []
  def make_the_code
    4.times do
      guess = rand 
      if guess <= 0.3
        @@store_code.push("🔴")
      elsif guess >= 0.5 && guess < 0.8
        @@store_code.push("🟢")
      elsif guess >= 0.8 && guess < 0.90
        @@store_code.push("🔵")
      else
        @@store_code.push("🟠")
      end
    end
    p @@store_code
  end
  
end

board = Board.new
board.make_the_code
# puts "⚪️"
# puts "⚫"

# puts "🔴"
# puts "🟢"
# puts "🔵"
# puts "🟠"

# 5.times do
#   p rand
# end