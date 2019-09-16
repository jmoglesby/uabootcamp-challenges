module Fibonacci
  def self.iterative_fib(number)
    res = [0]
    i = 1
    first_run = true

    number.times do
      if first_run
        res[i] = 1
        first_run = false
      else
        res[i] = res[i - 1] + res[i - 2]
      end

      i += 1
    end

    res.last
  end

  def self.semi_iterative_fib(number)
    res = 0
    prev = 0
    first_run = true

    number.times do
      if first_run
        res += 1
        first_run = false
      else
        hold = res
        res += prev
        prev = hold
      end
    end

    res
  end

  def self.recursive_fib1(num)
    num <= 1 ? num : recursive_fib1(num - 1) + recursive_fib1(num - 2)
  end

  def self.recursive_fib2(number)
    fib(number, 1, 0)
  end

  def self.fib(times, num, previous)
    if times.zero?
      previous
    else
      hold = num
      num += previous
      previous = hold
      times -= 1
      fib(times, num, previous)
    end
  end
end
