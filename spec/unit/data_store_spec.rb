# frozen_string_literal: true

require 'data_store'
require 'line'
require 'result'

RSpec.describe DataStore do
  subject { described_class.new }

  let(:line) { Line.new(path: '/about', ip: '192.168.0.2') }
  let(:invalid_line) { Line.new(path: nil, ip: '192.168.0.2') }

  describe 'initialization' do
    it 'can be intialized' do
      expect(subject).not_to be_nil
    end

    it 'has reader for results' do
      expect(subject).to respond_to(:results)
    end

    it 'has no writter for results' do
      expect(subject).not_to respond_to(:results=)
    end
  end

  describe '#result' do
    it 'responds to result' do
      expect(subject).to respond_to(:result)
    end
  end

  describe 'line parsing' do
    it 'has result' do
      subject.add_line(line)
      expect(subject.result(line)).to be_kind_of(Result)
    end

    context 'parse same line twice' do
      it 'increments unique visits by 1' do
        subject.add_line(line)
        subject.add_line(line)
        expect(subject.result(line).counters[:unique_hits]).to eq(1)
      end

      it 'increments hits by 2' do
        subject.add_line(line)
        subject.add_line(line)
        expect(subject.result(line).counters[:hits]).to eq(2)
      end
    end

    context 'invalid line' do
      it 'skip' do
        subject.load(line)
        subject.load(invalid_line)
        expect(subject.results.count).to eq(1)
      end
    end
  end
end
