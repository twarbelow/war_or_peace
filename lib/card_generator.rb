require './lib/card'
class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards #this method is messy
    cards = []
    File.open(filename).each do |line|
      suit = line.split.shift.to_sym
      value = line.split[1]
      value.tr!(",", "") 
      rank = line.split[2].to_i
      cards << Card.new(suit, value, rank)
    end
    cards.shuffle!
  end
end
