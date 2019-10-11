# frozen_string_literal: true

require 'analyzer'

describe Analyzer do
  subject { described_class.new(logfile) }
  let(:logfile) { 'spec/test.log' }

  describe '.all views' do
    let(:result) { { 'home' => 6, 'info' => 3, 'about' => 2 } }

    context 'when logfile is empty' do
      let(:logfile) { 'spec/empty.log' }

      it 'returns a message' do
        expect(subject.all_views).to eq('No logs inside')
      end
    end

    context 'when logfile is not empty' do
      it 'returns the expected result' do
        expect(subject.all_views).to eq(result)
      end
    end
  end

  describe '.unique views' do
    let(:result) { { 'home' => 4, 'about' => 2, 'info' => 2 } }

    context 'when logfile is empty' do
      let(:logfile) { 'spec/empty.log' }

      it 'returns a message' do
        expect(subject.unique_views).to eq('No logs inside')
      end
    end

    context 'when logfile is not empty' do
      it 'returns the expected result' do
        expect(subject.unique_views).to eq(result)
      end
    end
  end
end
