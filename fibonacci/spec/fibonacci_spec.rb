require 'spec_helper'
require 'benchmark'

RSpec.describe Fibonacci, type: :model do
  describe '.iterative_fib()' do
    it 'should return the correct value' do
      expect(Fibonacci.iterative_fib(0)).to eq 0
      expect(Fibonacci.iterative_fib(1)).to eq 1
      expect(Fibonacci.iterative_fib(2)).to eq 1
      expect(Fibonacci.iterative_fib(3)).to eq 2
      expect(Fibonacci.iterative_fib(4)).to eq 3
      expect(Fibonacci.iterative_fib(5)).to eq 5
      expect(Fibonacci.iterative_fib(6)).to eq 8
      expect(Fibonacci.iterative_fib(7)).to eq 13
      expect(Fibonacci.iterative_fib(8)).to eq 21
      expect(Fibonacci.iterative_fib(9)).to eq 34
    end
  end

  describe '.semi_iterative_fib()' do
    it 'should return the correct value' do
      expect(Fibonacci.semi_iterative_fib(0)).to eq 0
      expect(Fibonacci.semi_iterative_fib(1)).to eq 1
      expect(Fibonacci.semi_iterative_fib(2)).to eq 1
      expect(Fibonacci.semi_iterative_fib(3)).to eq 2
      expect(Fibonacci.semi_iterative_fib(4)).to eq 3
      expect(Fibonacci.semi_iterative_fib(5)).to eq 5
      expect(Fibonacci.semi_iterative_fib(6)).to eq 8
      expect(Fibonacci.semi_iterative_fib(7)).to eq 13
      expect(Fibonacci.semi_iterative_fib(8)).to eq 21
      expect(Fibonacci.semi_iterative_fib(9)).to eq 34
    end
  end

  describe '.recursive_fib1()' do
    it 'should return the correct value' do
      expect(Fibonacci.recursive_fib1(0)).to eq 0
      expect(Fibonacci.recursive_fib1(1)).to eq 1
      expect(Fibonacci.recursive_fib1(2)).to eq 1
      expect(Fibonacci.recursive_fib1(3)).to eq 2
      expect(Fibonacci.recursive_fib1(4)).to eq 3
      expect(Fibonacci.recursive_fib1(5)).to eq 5
      expect(Fibonacci.recursive_fib1(6)).to eq 8
      expect(Fibonacci.recursive_fib1(7)).to eq 13
      expect(Fibonacci.recursive_fib1(8)).to eq 21
      expect(Fibonacci.recursive_fib1(9)).to eq 34
    end
  end

  describe '.recursive_fib2()' do
    it 'should return the correct value' do
      expect(Fibonacci.recursive_fib2(0)).to eq 0
      expect(Fibonacci.recursive_fib2(1)).to eq 1
      expect(Fibonacci.recursive_fib2(2)).to eq 1
      expect(Fibonacci.recursive_fib2(3)).to eq 2
      expect(Fibonacci.recursive_fib2(4)).to eq 3
      expect(Fibonacci.recursive_fib2(5)).to eq 5
      expect(Fibonacci.recursive_fib2(6)).to eq 8
      expect(Fibonacci.recursive_fib2(7)).to eq 13
      expect(Fibonacci.recursive_fib2(8)).to eq 21
      expect(Fibonacci.recursive_fib2(9)).to eq 34
    end
  end
end

num = 20
Benchmark.bm do |x|
  x.report('iterative_fib') { Fibonacci.iterative_fib(num) }
  x.report('semi_iterative_fib') { Fibonacci.semi_iterative_fib(num) }
  x.report('recursive_fib1') { Fibonacci.recursive_fib1(num) }
  x.report('recursive_fib2') { Fibonacci.recursive_fib2(num) }
end
