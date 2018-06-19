require 'rspec'
require_relative 'people'
require_relative 'driver'
require_relative 'customer'

RSpec.describe People do
  describe '#calculateDistance' do
    it 'return distance between 2 object' do
      customer = People.new(15,16)
      driver = People.new(10,10)
      expect(customer.calculatePeopleDistance(driver).floor).to eq(7)
    end
  end
end

describe '#calculateCustomerAndDriver' do
  it 'return distance between customer and driver' do
    customer = Customer.new(15,16)
    driver = Driver.new("ali",10,10)
    expect(customer.calculatePeopleDistance(driver).floor).to eq(7)
  end
end