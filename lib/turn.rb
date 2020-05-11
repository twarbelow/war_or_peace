class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :spoils_of_war,
              :best

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @best = ""
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards"
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    if gets.chomp.upcase == "GO"
      turn_count = 0

    else p "Ok, mayber next time!"
    end
  end

  def type
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      :basic
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      :mutually_assured_destruction
    else :war
    end
  end

  def winner
    if self.type == :basic
      if player1.deck.cards[0].rank >= player2.deck.cards[0].rank
        @best = player1.name
      else
        @best = player2.name
      end
    elsif self.type == :war
      if player1.deck.cards[2].rank >= player2.deck.cards[2].rank
        @best = player1.name
      else
        @best = player2.name
      end
    else self.type == :mutually_assured_destruction
      "No Winner!"
    end
  end

  def pile_cards
    @best = self.winner
    if self.type == :basic
      spoils_of_war.concat [player1.deck.cards.shift, player2.deck.cards.shift]
    elsif self.type == :war
      spoils_of_war.concat player1.deck.cards.shift(3), player2.deck.cards.shift(3)
    else # type == mutually assured destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils
    if player1.name == best
      player1.deck.cards.concat spoils_of_war
    else
      player2.deck.cards.concat spoils_of_war
    end
  end
end
