require 'plane'

describe Plane do

  before :each do
    @airport = Airport.new
    @plane = Plane.new
    allow(Weather).to receive(:stormy?) { false }
    allow(@plane).to receive(:status) { "Flying" }
  end

  it { is_expected.to respond_to :status }

  it 'should ensure that planes always begin in the air' do
    expect(@plane.status).to eq "Flying"
  end

  it 'should return true when asked if grounded plane is grounded' do
    @plane.status = "Landed"
    expect(@plane.landed?).to be true
  end

  it 'should return false when asked if a grounded plane is in the air' do
    @plane.status = "Landed"
    expect(@plane.flying?).to eq false
  end

  describe '#update_status' do
    it { is_expected.to respond_to(:update_status) }
  end
end
