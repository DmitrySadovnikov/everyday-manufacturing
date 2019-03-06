require 'spec_helper'

describe FrozenThing::Customer do
  describe '#filter_by_distance' do
    subject { described_class.filter_by_distance }

    it 'returns correct customers' do
      expectation = [
        { user_id: 4, name: 'Ian Kehoe', distance: 41.63 },
        { user_id: 5, name: 'Nora Dempsey', distance: 40.24 },
        { user_id: 6, name: 'Theresa Enright', distance: 38.25 },
        { user_id: 11, name: 'Richard Finnegan', distance: 51.61 },
        { user_id: 12, name: 'Christina McArdle', distance: 56.33 },
        { user_id: 13, name: 'Olive Ahearn', distance: 19.63 },
        { user_id: 15, name: 'Michael Ahearn', distance: 32.5 },
        { user_id: 26, name: 'Stephen McArdle', distance: 55.58 },
        { user_id: 28, name: 'Charlie Halligan', distance: 93.27 },
        { user_id: 29, name: 'Oliver Ahearn', distance: 68.59 },
        { user_id: 30, name: 'Nick Enright', distance: 74.21 },
        { user_id: 31, name: 'Alan Behan', distance: 0.0 },
        { user_id: 39, name: 'Lisa Ahearn', distance: 34.41 }
      ]

      result = subject.map { |c| { user_id: c.user_id, name: c.name, distance: c.distance } }
      expect(result).to eq(expectation)
    end

    context 'when file does not exist' do
      before do
        allow(File).to receive(:exist?).and_return(false)
      end

      it 'raises file_not_found error' do
        expect { subject }.to raise_error(FrozenThing::FileNotFoundError)
      end
    end

    context 'when invalid content' do
      before do
        allow(JSON).to receive(:parse).and_raise(StandardError)
      end

      it 'raises invalid_content error' do
        expect { subject }.to raise_error(FrozenThing::InvalidFileContentError)
      end
    end
  end
end
