require 'Oystercard'

describe Oystercard do
  let(:station){ double :station }

  it { expect(subject).to respond_to(:balance) }
 
  it { expect(subject).to respond_to(:top_up) }

  it { expect(subject).to respond_to(:top_up).with(1).argument }

  it { expect(subject).to respond_to(:touch_in).with(1).argument }

  describe "#top_up" do
    it "Expects balance to increase by top up amount" do
      expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
    end

    it "Expects error if balance exceeds £90" do
      expect{ subject.top_up 100 }.to raise_error "The maximum limit is £90"
    end
  end

  describe '#touch_in' do
      it "Expects an error for touching in if balance is less than £1" do
        expect{ subject.touch_in(station) }.to raise_error "You need to top up"
      end
  end

  describe '#touch_out' do
      it 'reduces balance by MIN_FARE' do
        subject.top_up(90)
        station_1 = double("station_1", zone: 1)
        subject.touch_in(station_1)
        subject.touch_out(station_1)
        expect(subject.balance).to eq (89)
      end

    it "Reduces the blanace by penalty fare if card has not touch out" do
      subject.top_up(10)
      subject.touch_in("station")
      subject.touch_in("station")
      expect(subject.balance).to eq (4)
    end 

    it 'reduces balance by penalty fare if card has not touched in' do
      subject.top_up(10)
      subject.touch_out("station")
      expect(subject.balance).to eq (4)
    end

  end

end
