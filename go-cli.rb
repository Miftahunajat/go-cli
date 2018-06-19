require_relative 'map'

class GoCli
  @prices = 200

  def initialize
    @map = Map.new
  end

  def main
    STDOUT.puts "Menu", "Select your action"
    STDOUT.puts "1. Show map", "2. Order GO-Ride", "3. View History", "4. Exit"
    STDOUT.print "Your choice [1..4] : "
    opt = STDIN.gets.chomp.to_i
    while opt != 4
      case opt
        when 1
          show_map
          puts "Please select other action"
          print "Your choice [1..4] : "
          opt = gets.chomp.to_i
        when 2
          order_go_ride
        when 3
          view_history
        when 4

        else
          puts "Cannot understand your meaning", "Please select your choice [1..4] : "
          gets.chomp.to_i
      end
    end

  end

  private
    def show_map
      @map.show_map
    end

    def order_go_ride

    end

    def view_history

    end
end

case ARGV.size
when 0
  client = GoCli.new
  client.main
when 1
  STDOUT.puts "Invalid file name"
when 3
  STDOUT.puts "Three Parameter Launch"
else
  STDOUT.puts "Invalid Parameter Number"
end