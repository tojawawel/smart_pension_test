# frozen_string_literal: true

require 'parser'

describe Parser do
  subject { described_class.new }

  let(:logfile) { 'spec/test.log' }

  describe '.parse' do
    let(:result) do
      [['home', '111.111.111.111'],
       ['home', '111.111.111.111'],
       ['home', '222.222.222.222'],
       ['home', '333.333.333.333'],
       ['home', '333.333.333.333'],
       ['home', '444.444.444.444'],
       ['about', '333.333.333.333'],
       ['about', '111.111.111.111'],
       ['info', '555.555.555.555'],
       ['info', '555.555.555.555'],
       ['info', '111.111.111.111']]
    end
    context 'when file is incorrect' do
      let(:logfile) { 'spec/nonexist.log' }

      it 'raises an error' do
        expect { subject.parse(logfile) }.to raise_error(RuntimeError, 'No such file')
      end
    end

    context 'when file is correct' do
      it 'parses the file' do
        expect(subject.parse(logfile)).to eq(result)
      end

      it 'result is instance of array' do
        expect(subject.parse(logfile)).to be_instance_of(Array)
      end
    end
  end
end
