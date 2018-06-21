require_relative 'util'
require_relative 'customer'
require_relative 'driver'

class Map

  attr_accessor :customer, :size

  def initialize(drivers, n ,user_x, user_y)
    @size = n
    @occupied = Hash.new
    @drivers = []
    if user_x == -1 && user_y == -1
      visited = Util.getRandomCoordinate(@size)
    else
      visited = [user_x, user_y]
    end
    @customer = Customer.new(*visited)
    @occupied[[visited[1], visited[0]]] = @customer

    drivers.each do |key, value|
      visited = value
      driver = Driver.new(key, *value)
      @drivers << driver
      @occupied[visited] = driver
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
    @occupied[[y,x]] = @customer
  end

  def get_route (finish, start = @customer.get_loc.reverse)
    route = ''
    route << "start at (#{start[0]},#{start[1]})\n"
    if finish[0] != start[0] && finish[1] != start[1]
      route << "go to (#{start[0]},#{finish[1]})\n"
    elsif finish[1] != start[1]
    end
    (((finish[0] - start[0]) * (finish[1] - start[1])) > 0) ? route << "turn left\n" : route << "turn right\n" if start[0] != finish[0] && start[1] != finish[1]
    route << "go to (#{finish[0]},#{finish[1]})\n"
    route << "finish at (#{finish[0]},#{finish[1]})\n"
    route
  end
end