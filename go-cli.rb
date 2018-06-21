require_relative 'map'

class GoCli

  def initialize(drivers, n = 20, user_x = -1, user_y = -1)
    @map = Map.new(drivers,n.to_i,user_x.to_i,user_y.to_i)
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
          opt = STDIN.gets.chomp.to_i
        when 2
          order_go_ride
          puts "Please select other action"
          print "Your choice [1..4] : "
          opt = STDIN.gets.chomp.to_i
        when 3
          view_history
          puts "Please select other action"
          print "Your choice [1..4] : "
          opt = STDIN.gets.chomp.to_i
        when 4

        else
          print "Cannot understand your meaning", "Please select your choice [1..4] : "
          opt = STDIN.gets.chomp.to_i
      end
    end

  end

  private
    def show_map
      @map.show_map
    end

    def order_go_ride
      print "Enter your destination (separate with spaces) (x y) : "
      a = STDIN.gets.chomp.to_s
      arr = a.split().map {|x| x[/\d+/]}.collect {|x| x.to_i}
      if arr.size != 2
        puts "Invalid parameter number."
        return
      elsif !arr.all? {|i| i < @map.size}
        puts "Invalid location"
        return
      end
      puts @map.size
      totalPrice = @map.get_distance_from_customer(*arr[0..1])*get_price
      driver = @map.get_nearest_driver

      puts "\n================","================\n"
      puts "Driver Name: ", "#{driver.name}\n"
      puts "Route : \n"
      puts @map.get_route(arr)
      puts "Price : ", "Rp #{totalPrice}\n"
      print "Confirm ? (y/n) : "
      answer = STDIN.gets.chomp.to_s
      if answer.match?(/[1y](?:es)?/i)
        write_history(driver.name, @map.customer.get_loc,arr,totalPrice)
        ride_user(*arr)
      end

    end

    def view_history
      puts "Viewing history . . . . . . .\n\n\n"
      input = IO.read("database")
      puts input
      puts "\n\n"
    end

    def ride_user x,y
      @map.move_customer(x,y)
      puts "You have already reached your destination"
    end

    def write_history (driver_name, start, destination, price)
      output = File.open("database","a+")
      output << "\n==============\n"
      output << "Driver : #{driver_name}\n"
      output << "Start : #{start[0]}, #{start[1]}\n"
      output << "Destination : #{destination[0]}, #{destination[1]}\n"
      output << "Route : \n"
      output << "#{@map.get_route(destination,start)}\n"
      output << "Price : Rp. #{price}\n"
      output << "==============\n\n"
      output.close
    end

    #default price
    def get_price
      price = 200
      price
    end
end

# Main Block
drivers_name = ["ali", "kojek", "rahul", "micky", "bonbon", "peeman", "theo"]
case ARGV.size
when 0

  drivers = Hash.new
  5.times do |i|
    drivers[drivers_name[i]] = Util.getRandomCoordinate(20)
  end
  client = GoCli.new(drivers)
  client.main
when 1
  file = IO.readlines(ARGV[0])
  n = file[0].to_i
  start_x , start_y = file[1].split(" ").collect {|x| x.to_i}
  driver_count = file[2].to_i
  drivers = Hash.new
  driver_count.times do |i|
    arr = file[3 + i].split(" ")

    drivers[arr[0]] = [arr[1].to_i, arr[2].to_i]
  end
  client = GoCli.new(drivers,n,start_x, start_y)
  client.main
when 3
  drivers = Hash.new
  5.times do |i|
    drivers[drivers_name[i]] = Util.getRandomCoordinate(20)
  end
  client = GoCli.new(drivers, *ARGV)
  client.main
else
  STDOUT.puts "Invalid Parameter Number"
end