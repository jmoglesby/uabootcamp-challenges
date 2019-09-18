module StringToInt
  def self.convert_to_int(string)
    return 'Invalid string' unless string.scan(/[:alpha:]/).empty?

    array = string.gsub(',', '').reverse.scan(/./)

    res = 0
    multiplier = 1
    array.each do |n|
      case n
      when '0'
        res += 0 * multiplier
      when '1'
        res += 1 * multiplier
      when '2'
        res += 2 * multiplier
      when '3'
        res += 3 * multiplier
      when '4'
        res += 4 * multiplier
      when '5'
        res += 5 * multiplier
      when '6'
        res += 6 * multiplier
      when '7'
        res += 7 * multiplier
      when '8'
        res += 8 * multiplier
      when '9'
        res += 9 * multiplier
      end

      multiplier *= 10
    end

    return res
  end
end
