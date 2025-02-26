require_relative "players"

class Board < Player
  @@store_code = []
  @@store_key = []
  @@computer_guess = []
  def make_the_code
    @@store_code.clear
    4.times do
      guess = rand
      if guess <= 0.25
        @@computer_guess.push("🔴")
      elsif guess <= 0.5
        @@computer_guess.push("🟢")
      elsif guess <= 0.75
        @@computer_guess.push("🔵")
      else
        @@computer_guess.push("🟠")
      end
    end
  end
  def guess_the_player_code_computer
    4.times do
      guess = rand
      if guess <= 0.25
        @@store_code.push("🔴")
      elsif guess <= 0.5
        @@store_code.push("🟢")
      elsif guess <= 0.75
        @@store_code.push("🔵")
      else
        @@store_code.push("🟠")
      end
    end
  end
  def catch_the_guess_player
    valid_colors = { "red" => "🔴", "blue" => "🔵", "green" => "🟢", "yellow" => "🟠" }
    puts "Enter your guesses (red, blue, green, yellow):"
    key = gets.chomp.downcase
    while !valid_colors.key?(key)
      puts "Invalid input. Please enter one of the following colors: red, blue, green, yellow."
      key = gets.chomp.downcase
    end
    @@store_key.push(valid_colors[key])
  end

  def make_the_guess_player
    @@store_key.clear
    4.times do
      catch_the_guess_player
    end
  end

  def compare_the_guess_and_provide_feedback
    black = 0
    white = 0
    code_copy = @@store_code.dup
    key_copy = @@store_key.dup

    code_copy.each_with_index do |value, index|
      if value == key_copy[index]
        black += 1
        code_copy[index] = nil
        key_copy[index] = nil
      end
    end

    key_copy.compact.each do |value|
      if code_copy.include?(value)
        white += 1
        code_copy[code_copy.index(value)] = nil
      end
    end

    puts "Feedback:"
    black.times { print "⚫ " }
    white.times { print "⚪ " }
    puts

    if black == 4
      puts "You Win"
      return true
    else
      puts "Try again."
      return false
    end
  end

  def render_view
    puts "Here is the board:"
    @@store_key.each_slice(4) do |slice|
      puts slice.join(" ")
    end
  end
end