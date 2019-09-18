module StringToInt
  def self.convert_to_int(string)
    return 'Invalid string' unless string.gsub(',','').gsub('.','').gsub('-','').scan(/[[:alpha:][:punct:]]/).empty?

    roundby = 0
    if string.include?('.')
      halves = string.split('.')
      roundby = halves[1].chars.first unless halves[1].nil?
      string = halves[0]
    end
    roundby = roundby.ord - 48

    array = string.gsub(',', '').reverse.scan(/./)
    sign = 1
    if array.last == '-'
      sign = -1
      array.pop
    end

    multiplier = 1
    res = 0
    array.each do |n|
      res += (n.ord - 48) * multiplier
      multiplier *= 10
    end

    (res + (!roundby.nil? && roundby >= 5 ? 1 : 0)) * sign
  end
end
