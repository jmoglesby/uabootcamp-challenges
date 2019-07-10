class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end
end

class Deck
  def initialize
    @cards = generate_cards
  end

  def generate_cards
    cards = []
    suits = [:diamonds, :hearts, :spades, :clubs]
    ranks = ['Ace', *(2..10), 'Jack', 'Queen', 'King']

    suits.map { |suit| ranks.map { |rank| cards << Card.new(rank, suit) } }
    return cards
  end

  def reveal_cards
    puts "Your Deck has these cards:"
    @cards.each do |card|
      puts "#{card.rank} of #{card.suit}"
    end
    puts "*************"
  end

  def shuffle
    @cards.shuffle!
    puts "
----------------------------
Your Deck has been shuffled.
----------------------------
"
  end

  def deal
    top_card = @cards.shift
    puts "The top card is... "
    top_card.output_card
  end
end

deck = Deck.new
deck.reveal_cards
deck.shuffle
deck.deal