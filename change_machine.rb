require 'rspec'

class ChangeMachine
  def change(cents)
    coins = []
    while cents > 0
      if cents >= 25
        next_coin = 25
      elsif cents >= 10
        next_coin = 10
      elsif cents >= 5
        next_coin = 5
      else
        next_coin = 1
      end
      coins << next_coin
      cents -= next_coin
    end
    coins
  end
end

RSpec.describe ChangeMachine do
  describe '#change' do
    it 'should return [1] when given 1' do
      machine = ChangeMachine.new
      expect(machine.change(1)).to eq([1])
    end
    it 'should return [1,1] when given 2' do
      machine = ChangeMachine.new
      expect(machine.change(2)).to eq([1,1])
    end
    it 'should return [5] when given 5' do
      machine = ChangeMachine.new
      expect(machine.change(5)).to eq([5])
    end
    it 'should return [5,1] when given 6' do
      machine = ChangeMachine.new
      expect(machine.change(6)).to eq([5,1])
    end
    it 'should return [10] when given 10' do
      machine = ChangeMachine.new
      expect(machine.change(10)).to eq([10])
    end
    it 'should return [10,5,1,1,1,1] when given 19' do
      machine = ChangeMachine.new
      expect(machine.change(19)).to eq([10,5,1,1,1,1])
    end
    it 'should return [25] when given 25' do
      machine = ChangeMachine.new
      expect(machine.change(25)).to eq([25])
    end
    it 'should return [25, 25, 25, 25, 10, 5, 1, 1, 1, 1] when given 119' do
      machine = ChangeMachine.new
      expect(machine.change(119)).to eq([25, 25, 25, 25, 10, 5, 1, 1, 1, 1])
    end
  end
end