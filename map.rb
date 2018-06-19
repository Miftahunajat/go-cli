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
      visited = Util.getRandomCoordinate(@size)
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
end