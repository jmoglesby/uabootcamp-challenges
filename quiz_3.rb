class Box
  attr_accessor :length, :width, :height, :volume
  
  def initialize length, width, height
    fail "Please give positive, non-zero numbers for all 3 values" unless 
      length.class == Integer &&
      length > 0 &&
      width.class == Integer &&
      width > 0 &&
      height.class == Integer &&
      height > 0
    
    @length = length
    @width = width
    @height = height
  end

  def dimensions
    puts "Dimensions:\n - Length: #{@length} ft.\n - Width: #{@width} ft.\n - Height: #{@height} ft."
  end

  def volume
    vol = @length * @width * @height
    puts "Volume: #{vol} cu. ft."
  end
end


# EXECUTE >>>>>>>>>>>>>>>>>>>>>>>>>>>>

puts "Let's make a box!"
puts "Please enter an integer for the length of the box:"
length = gets.chomp.to_i
puts "Please enter an integer for the width of the box:"
width = gets.chomp.to_i
puts "Please enter an integer for the height of the box:"
height = gets.chomp.to_i

box = Box.new(length, width, height)
puts "\n*********\nHere's the box you made:\n"
box.dimensions
puts ""
box.volume
puts "*********"