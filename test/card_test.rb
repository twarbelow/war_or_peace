require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    @card = Card.new(:diamond, 'Queen', 12)
  end

  def test_it_exists
    assert_instance_of Card, @card
  end

  def test_it_has_suit
    assert_equal :diamond, @card.suit
  end

  def test_it_has_value
    assert_equal 'Queen', @card.value
  end

  def test_it_has_rank
    assert_equal 12, @card.rank
  end
end
