require_relative 'util'
require_relative 'customer'
require_relative 'driver'

class Map

  attr_accessor :customer

  def initialize
    @size = 20
    @drivers_name = ["ali", "kojek", "rahul", "micky", "bonbon", "peeman", "theo"]
    @drivers = []
    @occupied = Hash.new
    visited = Util.getRandomCoordinate(@size)
    @customer = Customer.new(*visited)
    @occupied[visited] = @customer
    5.times do |i|
      visited = Util.getRandomCoordinate(@size) until !@occupied[visited]
      @drivers << (@occupied[visited] = Driver.new(@drivers_name[i],*visited) if !@occupied[visited])
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

  def get_route (finish, start = @customer.get_loc)
    route = ''
    route << "start at (#{start[0]},#{start[1]})\n"
    if finish[0] != start[0]
      route << "go to (#{finish[0]},#{start[1]})\n"
    elsif finish[1] != start[1]
    end
    (((finish[0] - start[0]) * (finish[1] - start[1])) > 0) ? route << "turn left\n" : route << "turn right\n" if start[0] != finish[0] && start[1] != finish[1]
    route << "go to (#{finish[0]},#{finish[1]})\n"
    route << "finish at (#{finish[0]},#{finish[1]})\n"
    route
  end
end