require 'plane'

describe Plane do

  # let(:plane) {Plane.new}

  subject { Plane.new }

  describe 'flying' do
    it 'should be flying when created' do
      expect(subject).to be_flying
    end
  end

  describe 'taking off' do
    it { is_expected.to respond_to :take_off }

# this:
    context 'after taking off' do
      it 'is flying' do
        subject.land
        subject.take_off
        expect(subject).to be_flying
      end
    end

#  or this:
    it 'should be fliying after taking off' do
      subject.land
      subject.take_off
      expect(subject).to be_flying
    end
  end

  describe 'landing' do
    it { is_expected.to respond_to :land}

    it 'should not be flying after it has landed' do
      subject.land
      expect(subject).not_to be_flying
    end
  end

end