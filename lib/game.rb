require_relative "board"

class Game < Board
  @@Codebreaker_turns = 0
  def play_game
    welcome
    select_computer_role
  end
  def game_start
    make_the_code
    12.times do
      make_the_guess_player
      break if compare_the_guess_and_provide_feedback
      render_view
      @@Codebreaker_turns +=1
      if @@Codebreaker_turns == 12
        puts "You lost better luck next time"
        break
      end
    end
    render_view
  end
  def switch_role
    if @@human_player == "Mastermind"
      make_the_guess_player
      guess_the_player_code_computer
    end
  end
end

game = Game.new
game.play_game
game.game_start