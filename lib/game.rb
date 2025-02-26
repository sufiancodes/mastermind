# frozen_string_literal: true

require_relative "board"

class Game < Board
  attr_accessor :human_turns, :computer_turns

  def initialize
    super
    @human_turns = 0
    @computer_turns = 0
  end

  def play_game
    welcome
    select_computer_role
    switch_role
  end

  def game_start
    make_the_code
    12.times do |turn|
      make_the_guess_player
      break if compare_the_guess_and_provide_feedback
  
      render_view
      if turn == 11
        puts "You lost, better luck next time"
      end
    end
    render_view
  end

  def switch_role
    if @human_player == "Mastermind"
      make_the_code
      12.times do |turn|
        guess_the_player_code_computer
        break if compare_the_guess_and_provide_feedback
  
        render_view
        if turn == 11
          puts "Computer lost"
        end
      end
    else
      game_start
    end
  end
  
end


