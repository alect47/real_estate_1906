class House
  attr_reader :price, :address, :rooms, :area

  def initialize(price, address, rooms = [], area = 0)
    @price = price
    @address = address
    @rooms = rooms
    @area = area
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.each do |room|
      @area += room.area
    end
    @area
  end


end
