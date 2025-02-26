# frozen_string_literal: true

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
      case rand(4)
      when 0 then @store_code.push("🔴")
      when 1 then @store_code.push("🟢")
      when 2 then @store_code.push("🔵")
      when 3 then @store_code.push("🟠")
      end
    end
  end

  def guess_the_player_code_computer
    @computer_guess.clear
    4.times do |i|
      if @feedback[i] == "⚫"
        @computer_guess.push(@store_code[i])
      else
        case rand(4)
        when 0 then @computer_guess.push("🔴")
        when 1 then @computer_guess.push("🟢")
        when 2 then @computer_guess.push("🔵")
        when 3 then @computer_guess.push("🟠")
        end
      end
    end
    p @computer_guess
  end

  def get_feedback
    puts "Enter feedback (e.g., '⚫⚫⚪' for 2 black and 1 white):"
    loop do
      feedback_input = gets.chomp
      if feedback_input.chars.all? { |c| %w[⚫ ⚪].include?(c) } && feedback_input.size == 4
        @feedback = feedback_input.chars
        break
      else
        puts "Invalid feedback. Please enter exactly 4 of ⚫ and/or ⚪."
      end
    end
  end

  def catch_the_guess_player
    valid_colors = { "red" => "🔴", "blue" => "🔵", "green" => "🟢", "orange" => "🟠" }
    puts "Enter your color (red, blue, green, orange):"
    key = gets.chomp.downcase
    until valid_colors.key?(key)
      puts "Invalid input. Please enter one of the following colors: red, blue, green, orange."
      key = gets.chomp.downcase
    end
    @store_key.push(valid_colors[key])
  end

  def make_the_guess_player
    @store_key.clear
    4.times { catch_the_guess_player }
  end

  def compare_the_guess_and_provide_feedback
    code_copy = @store_code.dup
    key_copy = @human_player == "Codebreaker" ? @store_key.dup : @computer_guess.dup
  
    black = 0
    white = 0
    @feedback = []
  
    # Check for black pegs
    code_copy.each_with_index do |value, index|
      next unless value == key_copy[index]
  
      black += 1
      code_copy[index] = nil
      key_copy[index] = nil
      @feedback[index] = "⚫"
    end
  
    # Check for white pegs
    key_copy.each_with_index do |value, index|
      next if value.nil?
  
      found_index = code_copy.index(value)
      next unless found_index
  
      white += 1
      code_copy[found_index] = nil
    end
  
    if @human_player == "Codebreaker"
      puts "Feedback: #{'⚫ ' * black}#{'⚪ ' * white}"
      if black == 4
        puts "Congratulations! You won!"
        true
      else
        false
      end
    else
      puts "Computer's guess: #{@computer_guess.join(' ')}"
      get_feedback
      if @feedback.count("⚫") == 4
        puts "Computer Wins!"
        true
      else
        guess_the_player_code_computer
        false
      end
    end
  end

  def render_view
    puts "Here is the board:"
    if @human_player == "Codebreaker"
      @store_key.each_slice(4) { |slice| puts slice.join(" ") }
    else
      @computer_guess.each_slice(4) { |slice| puts slice.join(" ") }
    end
  end
end
