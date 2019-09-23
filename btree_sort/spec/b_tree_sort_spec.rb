require 'spec_helper'

RSpec.describe BTreeSort do
  describe 'btree sort should work' do
    it 'should order the array' do
      expected = [1, 4, 6, 7, 9, 10, 14]
      array = [7, 4, 9, 1, 6, 14, 10]
      expect(BTreeSort.sort(array)).to eq expected
    end

    it 'should order the array with dupes' do
      expected =  [1, 2, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10, 11, 12, 13]
      array =     [5, 12, 7, 10, 2, 5, 8, 1, 13, 2, 6, 4, 9, 3, 11]
      expect(BTreeSort.sort(array)).to eq expected
    end

    it 'should handle really big arrays' do
      array = []
      5000.times do
        array << rand(1..5000)
      end
      expected = array.sort

      expect(BTreeSort.sort(array)).to eq expected
    end
  end
end
