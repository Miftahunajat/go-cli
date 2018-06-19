require 'rspec'

RSpec.describe People do
  describe '#calculateDistance' do
    it 'return distance between 2 object' do
      customer = People.new(15,16)
      driver = People.new(10,10)
      expect(customer.calculateDistance(driver).floor).to eq(7)
    end
  end
end
