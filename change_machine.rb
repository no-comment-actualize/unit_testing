require 'rspec'

RSpec.describe ChangeMachine do
  describe '#change' do
    machine = ChangeMachine.new
    expect(machine.change(1)).to eq([1])
  end
end