require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

#this isn't a test 

# class CardGeneratorTest
#   def test_it_works
    cards = CardGenerator.new("cards.txt")
    p cards.cards
#     assert_equal [] , cards.cards
#   end
# end


#assert include all members of
