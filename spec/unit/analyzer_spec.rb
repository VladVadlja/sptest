# frozen_string_literal: true

require 'analyzer'
require 'file_not_found_error'

RSpec.describe Analyzer do
  subject { described_class.new(filename: 'weblog.log') }

  describe 'initialization' do
    it 'can be initialized' do
      expect(subject).not_to be_nil
    end

    it '#filename' do
      expect(subject.filename).to eq('weblog.log')
    end

    it '#parser' do
      expect(subject.data_store).not_to be_nil
    end
  end

  describe '#start' do
    context 'no file provided' do
      subject { described_class.new(filename: nil) }

      it '#filename' do
        expect(subject.filename).to be_nil
      end

      it 'will rescue FileNotFoundError' do
        expect { subject.start }.not_to raise_error
      end
    end

    context 'valid filename' do
      it 'analyze filename' do
        expect { subject.start }
      end
    end
  end
end
