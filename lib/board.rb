require_relative "players"

class Board < Player
  attr_accessor :store_code, :store_key, :computer_guess, :feedback

  def initialize
    @store_code = []
    @store_key = []
    @computer_guess = []
    @feedback = []
  end

  def make_the_code
    @store_code.clear
    4.times do
      guess = rand
      case guess
      when 0...0.25
        @store_code.push("🔴")
      when 0.25...0.5
        @store_code.push("🟢")
      when 0.5...0.75
        @store_code.push("🔵")
      else
        @store_code.push("🟠")
      end
    end
  end

  def guess_the_player_code_computer
    @computer_guess.clear
    @feedback = [""] * 4 if @feedback.empty?
    4.times do |i|
      guess = rand
      if @feedback[i] == "⚫"
        @computer_guess.push(@store_code[i])
      else
        case guess
        when 0...0.25
          @computer_guess.push("🔴")
        when 0.25...0.5
          @computer_guess.push("🟢")
        when 0.5...0.75
          @computer_guess.push("🔵")
        else
          @computer_guess.push("🟠")
        end
      end
    end
    p @computer_guess
  end

  def get_feedback
    puts "Enter feedback (e.g., '⚫⚫⚪' for 2 black and 1 white):"
    feedback_input = gets.chomp
    @feedback = feedback_input.chars
  end

  def catch_the_guess_player
    valid_colors = { "red" => "🔴", "blue" => "🔵", "green" => "🟢", "yellow" => "🟠" }
    puts "Enter your color (red, blue, green, yellow):"
    key = gets.chomp.downcase
    until valid_colors.key?(key)
      puts "Invalid input. Please enter one of the following colors: red, blue, green, yellow."
      key = gets.chomp.downcase
    end
    @store_key.push(valid_colors[key])
  end

  def make_the_guess_player
    @store_key.clear
    4.times { catch_the_guess_player }
  end

  def compare_the_guess_and_provide_feedback
    black = 0
    white = 0
    code_copy = @store_code.dup
    key_copy = @computer_guess.dup

    @feedback.clear

    code_copy.each_with_index do |value, index|
      if value == key_copy[index]
        black += 1
        code_copy[index] = nil
        key_copy[index] = nil
        @feedback[index] = "⚫"
      end
    end

    key_copy.compact.each_with_index do |value, index|
      next unless value && code_copy.include?(value)

      white += 1
      code_copy[code_copy.index(value)] = nil
      @feedback[index] ||= "⚪"
    end

    puts "Feedback:"
    black.times { print "⚫ " }
    white.times { print "⚪ " }
    puts

    if black == 4
      puts "Computer Wins"
      true
    else
      get_feedback
      puts "Computer's next guess:"
      guess_the_player_code_computer
      false
    end
  end

  def render_view
    puts "Here is the board:"
    @store_key.each_slice(4) { |slice| puts slice.join(" ") }
  end
end
