class House
  attr_reader :price, :address, :rooms, :area, :rooms_by_area, :rooms_by_category

  def initialize(price, address, rooms = [], area = 0, rooms_by_area = [], rooms_by_category = {})
    @price = price
    @address = address
    @rooms = rooms
    @area = area
    @rooms_by_area = rooms_by_area
    @rooms_by_category = rooms_by_category
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

  def price_per_square_foot
    price = @price[1..-1].to_f
    (price / area).round(2)
  end

  # def rooms_by_area
  #   @room_areas = @rooms.map do |room|
  #     room.area
  #   end.sort.reverse
  #
  #   @rooms.each do |room|
  #     room_areas.each do |area|
  #       if @rooms.area == area
  #         @rooms_by_area << room
  #       end
  #   end
  #   @rooms_by_area
  # end

  def rooms_by_area
    @rooms.sort_by { |room| room.area}.reverse
  end

  def rooms_by_category
    #@rooms_by_category = @rooms.sort_by { |room| room.category}
    @rooms.each do |room|
      if !@rooms_by_category.keys.include?(room.category)
        @rooms_by_category[room.category] = []
      end
        @rooms_by_category[room.category] << room
    end
    @rooms_by_category
  end


end
