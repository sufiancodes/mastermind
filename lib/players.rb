class Player
  @@role_one = nil
  @@role_two = nil
  def welcome
    puts "Welcome pick role Mastermind or Codebreaker"
    @@role_one = gets.chomp
    until @@role_one == "Codebreaker" || "Mastermind"
      @@role_one = gets.chomp 
    end
  end
  def select_computer_role
    if @@role_one == "Codebreaker"
      @@role_two = "Mastermind"
    else
      @@role_two = "Codebreaker"
    end
  end
end

l = Player.new
l.welcome
l.select_computer_role