require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


# pry(main)> card1 = Card.new(:diamond, 'Queen', 12)
# #=> #<Card:0x007fbfd18490e8...>

# pry(main)> card2 = Card.new(:spade, '3', 3)
# #=> #<Card:0x007fbfd19f4fa0...>

# pry(main)> card3 = Card.new(:heart, 'Ace', 14)
# #=> #<Card:0x007fbfd18555a0...>



# pry(main)> cards = [card1, card2, card3]

# pry(main)> deck = Deck.new(cards)
# #=> #<Deck:0x007fbfd2984808 @cards=[#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]>

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)
  end

# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
  def test_it_has_cards
    @deck.cards
    assert_equal @cards, @deck.cards
  end

# pry(main)> deck.rank_of_card_at(0)
# #=> 12
# pry(main)> deck.rank_of_card_at(2)
# #=> 14
  def test_it_can_find_card_rank
    assert_equal 12, @deck.rank_of_card_at(0)
    assert_equal 14, @deck.rank_of_card_at(2)
  end

# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]

# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd18555a0...>]
  def test_it_can_identify_high_ranking_cards
    assert_equal [@card1, @card3], @deck.identify_high_ranking_cards
  end

# pry(main)> deck.percent_high_ranking
# #=> 66.67
def test_it_can_calculate_percent_of_high_ranking_cards
  assert_equal 66.67, @deck.percent_high_ranking
end

# pry(main)> deck.remove_card
# #=> #<Card:0x007fbfd18490e8 @rank=12, @suit=:diamond, @value="Queen">
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
# pry(main)> deck.percent_high_ranking
# #=> 50.0
def test_it_can_remove_card
  assert_equal @card1, @deck.remove_card
  assert_equal [@card2, @card3], @deck.cards
      assert_equal [@card3], @deck.identify_high_ranking_cards
  assert_equal 50.0, @deck.percent_high_ranking
end

# pry(main)> card4 = Card.new(:club, '5', 5)
# #=> #<Card:0x007fbfd2963978 @rank=5, @suit=:club, @value="5">

# pry(main)> deck.add_card(card4)

# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>, #<Card:0x007fbfd2963978...>]

# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]

# pry(main)> deck.percent_high_ranking
# #=> 33.33
end
