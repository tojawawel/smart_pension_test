# frozen_string_literal: true

require 'analyzer'

describe Analyzer do
  subject { described_class.new(logfile) }
  let(:logfile) { 'spec/test.log' }

  describe '.all views' do
    context 'when logfile is empty' do
      let(:logfile) { 'spec/empty.log' }

      it 'returns a message' do
        expect(subject.all_views).to eq('No logs inside')
      end
    end
  end
end
