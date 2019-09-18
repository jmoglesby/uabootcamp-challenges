require 'spec_helper'

RSpec.describe StringToInt do
  describe '-- convert_to_int() --' do
    it 'should convert any given number-string to an integer' do
      expect(StringToInt.convert_to_int('4')).to eq 4
      expect(StringToInt.convert_to_int('18')).to eq 18
      expect(StringToInt.convert_to_int('640')).to eq 640
      expect(StringToInt.convert_to_int('15,041')).to eq 15041
      expect(StringToInt.convert_to_int('456801')).to eq 456801
    end

    it 'should throw an error if passed an invalid string' do
      expect(StringToInt.convert_to_int('4,hi')).to eq 'Invalid string'
    end
  end
end
