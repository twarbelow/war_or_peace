require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'


full_deck = CardGenerator.new('cards.txt').cards

deck1 = full_deck.shift(26)
deck2 = full_deck

player_deck1 = Deck.new(deck1)
player_deck2 = Deck.new(deck2)

player1 = Player.new("Megan", player_deck1)
player2 = Player.new("Aurora", player_deck2)

turn = Turn.new(player1, player2)

turn.start


# Use p to display a line of text output to the user
# Keep in mind that your existing objects should still pass all existing tests - nothing that you add in this iteration should break anything that functioned in iterations 1 or 2!
# The user will then see each turn being played, like this:
#
# Turn 1: Megan won 2 cards
# Turn 2: WAR - Aurora won 6 cards
# Turn 3: *mutually assured destruction* 6 cards removed from play
# ...
# ...
# ...
# Turn 9324: Aurora won 2 cards
# *~*~*~* Aurora has won the game! *~*~*~*
# The game continues until one player has all cards in play, at which point, that player is declared the winner of the game! Hint: take a look at the classes that you have built already, is there a method that will help you determine when the game has been won? or lost?
#
# In this game, there is the possibility of no winner. In order to cut down the amount of time it takes to play each game, and ensure that the game eventually does end, only 1,000,000 turns will be allowed. If no player has all cards after 1,000,000 turns, the result of the game is a draw.
#
# Turn 1: Megan won 2 cards
# Turn 2: WAR - Aurora won 6 cards
# Turn 3: *mutually assured destruction* 6 cards removed from play
# ...
# ...
# ...
# Turn 1000000: Aurora won 2 cards
# ---- DRAW ----
