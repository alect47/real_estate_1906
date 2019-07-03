class Room
  attr_reader :category, :length, :width

  def initialize(category, length, width, area = 0)
    @category = category
    @length = length
    @width = width
    @area = area
  end

  def area
    @area = @length * @width
  end

end
