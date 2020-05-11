class Game
  attr_reader :round,
              :turn_number

  def initialize(round)
    @round = round
    @turn_number = 0
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards"
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    if gets.chomp.upcase == "GO"
      self.play
    else p "Ok, maybe next time!"
    end
  end

  def play
    while turn_number < 1000000
      @turn_number += 1
      round.pile_cards
      if round.type == :basic
        p "Turn #{turn_number}: #{round.best} won 2 cards!"
      elsif round.type == :war
        p "WAR - #{round.best} won 6 cards!"
      else
        p "Mutually Assured Destruction - 6 cards removed from play"
      end
      round.award_spoils
      if round.player1.deck == []
        abort "*~*~*~* #{round.player2.name} has won the game! *~*~*~*"
      elsif round.player2.deck == []
        abort "*~*~*~* #{round.player1.name} has won the game! *~*~*~*"
      end

    end
    if turn_number == 1000000
      abort "---- DRAW ----"
    end
  end

end

# different things happen for each turn type as described in turn class
  # use turn class to figure out what type of turn and then change ourput depending on turn type
  # output needs to tell player what type of turn happened
# basic = winner gains 2 cards
# war = winner gains 6 cards
# mutually assured destruction = 6 cards removed from play
