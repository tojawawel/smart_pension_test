# frozen_string_literal: true

require 'parser'

describe Parser do
  subject { described_class.new }

  let(:logfile) { 'spec/test.log' }

  describe '.parse' do
    context 'when file is incorrect' do
      let(:logfile) { 'spec/nonexist.log' }

      it 'raises an error' do
        expect { subject.parse(logfile) }.to raise_error(RuntimeError, 'No such file')
      end
    end
  end
end
