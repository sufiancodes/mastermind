class Board
  @@store_code = []
  @@store_key = []
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
  def catch_the_guess_player
    key = gets.chomp
    if key == "red"
      @@store_key.push("🔴")
    elsif key == "blue"
      @@store_key.push("🔵")
    elsif key == "green"
      @@store_key.push("🟢")
    else
      @@store_key.push("🟠")
    end
  end
  def make_the_guess_player
    4.times do
      catch_the_guess_player
    end
  end
  def show_key
    p @@store_key
  end
end

board = Board.new
board.make_the_code
board.make_the_guess_player
board.show_key