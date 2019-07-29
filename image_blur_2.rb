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
    @rows.each { |row| puts row.join(" ") }
  end
  
  def blur
    ones = []
    @rows.each_with_index do |row, i|
      row.each_with_index do |column, j|
        if column == 1
          ones << [i, j]
        end
      end
    end

    ones.each do |pixel|
      @rows.each_with_index do |row, i|
        row.each_with_index do |column, j|
          if ((i - pixel[0]).abs + (j - pixel[1]).abs) <= 1
            @rows[i][j] = 1 if @rows[i][j]
          end
        end
      end
    end
  end
end


# EXECUTE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 1]
])

puts "Image:"
image.output_image
image.blur
puts "\n\nBlurred Image:"
image.output_image