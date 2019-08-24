class Image
  def initialize (data)
    @data = data
    @max_x = @data[0].size
    @max_y = @data.size
  end

  def output_image
    @data.each do |sub|
      puts sub.join(",")
    end
  end

  def blur
    ones = find_ones

    potential_ones = blur_ones(ones)

    actual_ones = ones_within_image(potential_ones)

    actual_ones.each do |(y,x)|
      @data[y][x] = 1
    end
  end

  private

  def ones_within_image(possible_ones)
    ones = []

    possible_ones.each do |(y, x)|
      if in_image(x, y)
        ones.push([y, x])
      end
    end

    ones
  end

  def blur_ones(ones)
    blurs = []

    ones.each do |(y, x)|
      blurs.push([y-1,x])
      blurs.push([y+1,x])
      blurs.push([y,x-1])
      blurs.push([y,x+1])
    end

    blurs
  end

  def width(x)
    x >= 0 and x < @max_x
  end

  def height(y)
    y >= 0 and y < @max_y
  end

  def in_image(x, y)
    width(x) and height(y)
  end

  def find_ones
    ones = []

    @data.each_index do |x|
      @data[x].each_index do |y|
        val = @data[x][y]
        ones.push([x, y]) if val == 1
      end
    end

    ones
  end
end

arr = [[0, 0, 0, 0],
       [0, 1, 0, 0],
       [0, 0, 0, 1],
       [0, 0, 0, 0]]

i = Image.new(arr)

i.output_image

i.blur

puts "---"

i.output_image


# i.blur
# This is how code is going to get called. New method will be called "blur"

# To reach data within a 2D array puts arr[][]
# Save all the 1's using "find_1"

# for the first loop you will use an Empty array and every time it finds a '1' it will
# then save that "col and row location"
# in the new blank array

# 2nd Loop: use the index values of the numbers surrounding those 1 values to
# change all the values surrounding the value to "1's"

# Don't forget to compensate for values that are on the edges. ie if no value above,
# below, right, or left ignore the command.
