# frozen_string_literal: true

class Player
  attr_accessor :human_player, :computer

  def welcome
    puts "Welcome! Pick a role: Mastermind or Codebreaker"
    @human_player = gets.chomp.capitalize
    until ["Codebreaker", "Mastermind"].include?(@human_player)
      puts "Invalid role. Please pick either Mastermind or Codebreaker."
      @human_player = gets.chomp.capitalize
    end
  end

  def select_computer_role
    @computer = @human_player == "Codebreaker" ? "Mastermind" : "Codebreaker"
  end
end
