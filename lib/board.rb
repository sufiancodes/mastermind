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
  def compare_the_guess_and_provide_feedback
    black = 0
    white = 0
    code_copy = @@store_code
    key_copy = @@store_key
    code_copy.each_with_index do |value, index|
      if value == key_copy[index]
        black += 1
        code_copy[index] = nil
        key_copy[index] = nil
      end
    end
    key_copy.each_with_index do |value, index|
      if value && code_copy.include?(value)
        white += 1
        code_copy[code_copy.index(value)] = nil
      end
    end
    black.times do
      print "⚫\n"
      puts " Here is Feedback"
    end
    white.times do
      print "⚪\n"
      puts " Here is Feedback"
    end
  end
  def render_view
    puts "Here are the views"
    @@store_key.each_slice(4) do |slice|
      puts slice.join(" ")
    end
  end
end

board = Board.new
board.make_the_code
board.make_the_guess_player
board.compare_the_guess_and_provide_feedback
board.render_view

# def render_view
#   puts "Here are the views"
#   @@store_key.length.times do
#     puts "#{@@store_key[0]} #{@@store_key[1]} #{@@store_key[2]} #{@@store_key[3]}"
#   end
# end