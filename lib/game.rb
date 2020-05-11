def start
  p "Welcome to War! (or Peace) This game will be played with 52 cards"
  p "The players today are Megan and Aurora."
  p "Type 'GO' to start the game!"
  if gets.chomp.upcase == "GO"
    turn_number = 0
    while turn_number < 1000000
      turn_number += 1
      self.pile_cards
      p "Turn #{turn_number}: #{@best} won #{spoils_of_war.count} cards!"
      self.award_spoils
      if player1.deck == []
        abort "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      elsif player2.deck == []
        abort "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      end
      p "---- DRAW ----"
    end
  else p "Ok, maybe next time!"
  end
end
