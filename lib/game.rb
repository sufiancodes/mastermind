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
    12.times do
      make_the_guess_player
      break if compare_the_guess_and_provide_feedback

      render_view
      @human_turns += 1
      if @human_turns == 12
        puts "You lost, better luck next time"
        break
      end
    end
    render_view
  end

  def switch_role
    if @human_player == "Mastermind"
      make_the_code
      12.times do
        guess_the_player_code_computer
        break if compare_the_guess_and_provide_feedback

        render_view
        @computer_turns += 1
        if @computer_turns == 12
          puts "Computer lost"
          break
        end
      end
    else
      game_start
    end
  end
end

game = Game.new
game.play_game
