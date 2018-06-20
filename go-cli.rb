require_relative 'map'

class GoCli


  def initialize
    @map = Map.new
    @price = 200
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
          puts "Please select other action"
          print "Your choice [1..4] : "
          opt = gets.chomp.to_i
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
      print "Enter your destination (separate with spaces) (rows,cols) : "
      a = STDIN.gets.chomp.to_s
      arr = a.split().map {|x| x[/\d+/]}.collect {|x| x.to_i}
      totalPrice = @map.get_distance_from_customer(*arr[0..1])*@price
      driver = @map.get_nearest_driver

      puts "\n================","================\n"
      puts "Driver Name: ", "#{driver.name}\n"
      puts "Route : ", "Sebuah Rute\n"
      puts "Price : ", "Rp #{@price*@map.get_distance_from_customer(*arr)}\n"
      print "Confirm ? (y/n) : "
      answer = gets.chomp.to_s
      ride_user(*arr) if answer.match?(/[1y](?:es)?/i)
    end

    def view_history

    end

    def ride_user x,y
      @map.move_customer(x,y)
      puts "Anda sudah sampai tujuan"
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