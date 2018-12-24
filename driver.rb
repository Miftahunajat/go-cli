require_relative 'people'
class Driver < People
  attr_accessor :name

  def initialize(name,x,y)
    super(x,y)
    @name = name
  end
end