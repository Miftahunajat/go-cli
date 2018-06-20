require_relative 'util'
require_relative 'customer'
require_relative 'driver'

class Map

  def initialize
    @size = 20
    @drivers = []
    @occupied = Hash.new
    visited = Util.getRandomCoordinate(@size)
    @customer = Customer.new(*visited)
    @occupied[visited] = @customer
    5.times do
      visited = Util.getRandomCoordinate(@size) until !@occupied[visited]
      @drivers << (@occupied[visited] = Driver.new("Ali",*visited) if !@occupied[visited])
    end
  end

  def show_map
    @size.times do |i|
      @size.times do |j|
        if @occupied[[i,j]].is_a?(Customer)
          print "C"
        elsif @occupied[[i,j]].is_a?(Driver)
          print "D"
        else
          print "-"
        end
      end
      puts""
    end
  end
  
  def get_distance_from_customer(x,y)
    (@customer.x - x).abs + (@customer.y - y).abs
  end

  def get_nearest_driver
    nearest_driver = @drivers.min_by {|driver| @customer.calculatePeopleDistance(driver)}
    nearest_driver
  end

  def move_customer (x,y)
    @occupied.delete(@customer.get_loc)
    @customer.move(x,y)
    @occupied[@customer.get_loc] = @customer
  end
  
end