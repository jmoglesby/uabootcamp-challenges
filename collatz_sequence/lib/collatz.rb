module Collatz
  def self.sequence(number, sequence=[])
    sequence << number
    unless number == 1
      if number.even?
        number /= 2
      else
        number = 3 * number + 1
      end
      sequence(number, sequence)
    end
    sequence
  end

  def self.longest_sequence
    longest = { number: 0, length: 0 }

    (1..1_000_000).each do |n|
      length = sequence(n).length
      if length > longest[:length]
        longest[:length] = length
        longest[:number] = n
      end
    end

    "The number between 1 - 1,000,000 with the longest Collatz sequence is:
      #{longest[:number]} with a sequence of #{longest[:length]} numbers"
  end
end

puts Collatz.longest_sequence
