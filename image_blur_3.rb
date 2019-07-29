class Image
  attr_accessor :rows, :height, :length

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
        fail "All rows are not the same length!" unless first_row_length == row_length
      end

      row_lengths += index == 0 ? first_row_length : row_length
    end

    @length = row_lengths / rows.count
  end


  def output_image
    @rows.each { |row| puts row.join(" ") }
  end
  

  def blur distance
    fail "Distance supplied must be an integer!" unless distance.class == Integer

    ones = []
    @rows.each_with_index do |row, i|
      row.each_with_index do |column, j|
        if column == 1
          ones << [i, j]
        end
      end
    end

    ones.each do |one_pixel|
      @rows.each_with_index do |row, i|
        row.each_with_index do |column, j|
          if ((i - one_pixel[0]).abs + (j - one_pixel[1]).abs) <= distance
            @rows[i][j] = 1 if @rows[i][j]
          end
        end
      end
    end
  end
  
end


# EXECUTE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

image = Image.new([
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0]
])

puts "Image:"
image.output_image
image.blur(3)
puts "\n\nBlurred Image:"
image.output_image