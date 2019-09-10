require 'spec_helper'

RSpec.describe Collatz, type: :model do
  describe '.sequence()' do
    it 'should return the correct sequence length' do
      expect(Collatz.sequence(1).length).to eq 1
      expect(Collatz.sequence(2).length).to eq 2
      expect(Collatz.sequence(3).length).to eq 8
      expect(Collatz.sequence(4).length).to eq 3
      expect(Collatz.sequence(5).length).to eq 6
      expect(Collatz.sequence(6).length).to eq 9
      expect(Collatz.sequence(7).length).to eq 17
    end
  end
end
