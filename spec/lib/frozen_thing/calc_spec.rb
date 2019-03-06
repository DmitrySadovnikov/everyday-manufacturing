require 'spec_helper'

describe FrozenThing::Calc do
  describe '#distance' do
    subject { described_class.distance(start_point, end_point) }

    let(:start_point) do
      FrozenThing::Point.new(lat: 53.1489345, lon: -6.8422408)
    end

    let(:end_point) do
      FrozenThing::Point.new(lat: 52.3191841, lon: -8.5072391)
    end

    it 'returns correct result' do
      expect(subject).to eq(145.19)
    end

    context 'with invalid end_point' do
      let(:end_point) do
        FrozenThing::Point.new(lat: 100_500, lon: 100_500)
      end

      it 'raises error' do
        expect { subject }.to raise_error(FrozenThing::InvalidPointError)
      end
    end
  end
end
