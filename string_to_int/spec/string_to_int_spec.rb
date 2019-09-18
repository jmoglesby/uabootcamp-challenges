require 'spec_helper'

RSpec.describe StringToInt do
  describe '-- convert_to_int() --' do
    it 'should convert any simple number-string to an integer' do
      expect(StringToInt.convert_to_int('0')).to eq 0
      expect(StringToInt.convert_to_int('4')).to eq 4
      expect(StringToInt.convert_to_int('18')).to eq 18
      expect(StringToInt.convert_to_int('640')).to eq 640
      expect(StringToInt.convert_to_int('456801')).to eq 456_801
    end

    it 'should handle commas properly' do
      expect(StringToInt.convert_to_int('15,041')).to eq 15_041
    end

    it 'should handle negative numbers' do
      expect(StringToInt.convert_to_int('-6')).to eq -6
      expect(StringToInt.convert_to_int('-36,006')).to eq -36_006
    end

    it 'should properly round numbers passed with decimal values' do
      expect(StringToInt.convert_to_int('54.68')).to eq 55
      expect(StringToInt.convert_to_int('-1,603.3')).to eq -1_603
      expect(StringToInt.convert_to_int('-456.93')).to eq -457
      expect(StringToInt.convert_to_int('0.6')).to eq 1
      expect(StringToInt.convert_to_int('0.2')).to eq 0
      expect(StringToInt.convert_to_int('.8')).to eq 1
      expect(StringToInt.convert_to_int('-.6')).to eq -1
    end

    it 'should ignore extraneous decimals' do
      expect(StringToInt.convert_to_int('306.')).to eq 306
    end

    it 'should throw an error if passed an invalid string' do
      expect(StringToInt.convert_to_int('4,hi')).to eq 'Invalid string'
      expect(StringToInt.convert_to_int('46!7')).to eq 'Invalid string'
    end
  end
end
