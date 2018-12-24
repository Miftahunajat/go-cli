class People
  attr_accessor :x,:y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def move(x,y)
    @x = x
    @y = y
  end

  def get_loc
    [@y, @x]
  end

  def calculatePeopleDistance(people)
    sum_of_squares = (people.x - @x) ** 2 + (people.y - @y) ** 2
    Math.sqrt(sum_of_squares)
  end
end