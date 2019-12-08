# frozen_string_literal: true

require 'data_store'

RSpec.describe DataStore do
  subject { described_class.new }

  describe 'initialization' do
    it 'can be initialized' do
      expect(subject).not_to be_nil
    end

    context 'readers and writters' do
      it 'has reader for counters' do
        expect(subject).to respond_to(:counters)
      end

      it 'counter is not nil' do
        expect(subject.counters).not_to be_nil
      end
    end
  end

  describe '#hits_increment' do
    it 'increment hits' do
      subject.hits_increment
      expect(subject.counters[:hits]).to eq(1)
    end
  end

  describe '#unique_increment' do
    it 'increments unique hits' do
      subject.unique_increment
      expect(subject.counters[:unique_hits]).to eq(1)
    end
  end
end
