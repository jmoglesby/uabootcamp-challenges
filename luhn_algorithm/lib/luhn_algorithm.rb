module Luhn
  def self.valid?(number)
    digits = number.to_s.split(//).map(&:to_i).reverse
    sum = 0

    digits.each_with_index do |digit, index|
      if index.even?
        sum += digit
      else
        sum += (digit * 2) >= 10 ? (digit * 2) - 9 : digit * 2
      end
    end

    (sum % 10).zero?
  end
end
