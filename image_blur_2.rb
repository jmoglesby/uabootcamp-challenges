class Image
  def initialize rows
    @rows = rows
    @height = rows.count
    row_lengths = 0
    first_row_length = 0
    
    rows.each_with_index do |row, index|
      if index == 0
        first_row_length = row.count
      else
        row_length = row.count
        unless first_row_length == row_length
          # ideally, would throw an error and abort here
          puts "All rows are not the same length!"
        end
      end

      row_lengths += index == 0 ? first_row_length : row_length
    end

    @length = row_lengths / rows.count
  end

  def output_image
    @rows.each { |row| puts row.join }
  end
  
  def blur
    ones = []
    @rows.each_with_index do |arr, i|
      arr.each_with_index do |x, j|
        if x == 1
          ones << [i, j]
        end
      end
    end

    ones.each do |spot|
      if @rows[(spot[0]-1).abs][spot[1]]
        @rows[(spot[0]-1).abs][spot[1]] = 1
      end #blur spot above
      
      if @rows[spot[0]+1] && @rows[spot[0]+1][spot[1]]
        @rows[spot[0]+1][spot[1]] = 1
      end #blur spot below

      if @rows[spot[0]][(spot[1]-1).abs]
        @rows[spot[0]][(spot[1]-1).abs] = 1
      end #blur spot left

      if @rows[spot[0]][spot[1]+1]
        @rows[spot[0]][spot[1]+1] = 1
      end #blur spot right
    end
  end
end


# EXECUTE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
])

puts "Image:"
image.output_image
image.blur
puts "\n\nBlurred Image:"
image.output_image