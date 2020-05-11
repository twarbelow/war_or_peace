require './lib/card'
class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards #this method is messy
    cards = []
    File.open(filename).each do |line|
      suit = line.split.shift
      value = line.split[1]
      rank = line.split[2]
      cards << Card.new(suit, value, rank)
    end
    cards.shuffle!
  end
end
