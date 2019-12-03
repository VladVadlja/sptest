require "result"

RSpec.describe Result do
  subject { described_class.new }

  describe "initialization" do

    it "can be initialized" do
      expect(subject).not_to be_nil
    end

    context "readers and writters" do

      it "has reader for counters" do
        expect(subject).to respond_to(:counters)
      end

      it "counter is not nil" do
        expect(subject.counters).not_to be_nil
      end
    end
    
  end

  describe "#hits_increment" do

    it "increment hits" do
      expect{ subject.hits_increment }.to change{ subject.counters[:hits] }.from(0).to(1)
    end

  end

  describe "#unique_increment" do

    it "increments unique hits" do
      expect{ subject.unique_increment }.to change{ subject.counters[:unique_hits] }.from(0).to(1)
    end
  end

end
