require "line"

RSpec.describe Line do
  subject { described_class.new(path: "/about", ip: "192.168.0.2") }

  describe "initialization" do
    it "can be initialized" do
      expect(described_class).not_to be_nil
    end
		
		context "readers and writters" do
			it "responds to getter for path attribute" do
				expect(subject).to respond_to(:path)
			end

			it "responds to getter for ip attribute" do
				expect(subject).to respond_to(:ip)
			end

			it "doesn't have writter for path attribute" do
				expect(subject).not_to respond_to(:path=)
			end

			it "doesn't have writter for ip attribute" do
				expect(subject).not_to respond_to(:ip=)
			end

			it "read path attribute" do
				expect(subject.path).to eq("/about")
			end

			it "read ip attribute" do
				expect(subject.ip).to eq("192.168.0.2")
			end
		end
  end

	describe "#valid?" do

		it "respond to #valid?" do
			expect(subject).to respond_to(:valid?)
		end

		it "is valid when both path and ip are not nil" do
			expect(subject.valid?).to be(true)
		end

		context "path attribute" do
			subject { described_class.new(path: nil, ip: "192.168.0.3") }

			it "is not valid without path" do
				expect(subject.valid?).to be(false)
			end
		end

		context "ip attribute" do
			subject { described_class.new(path: "/about", ip: nil) }

			it "is not valid without ip" do
				expect(subject.valid?).to be(false)
			end
		end

	end

	describe "#==" do

		it "should respond to ==" do
			expect(subject).to respond_to(:==)
		end

		it "equal when same path and ip" do
			other = described_class.new(path: "/about", ip: "192.168.0.2")
			expect(subject).to eq(other)
		end

		it "not equal when path is different" do
			other = described_class.new(path: "/about/", ip: "192.168.0.2")
			expect(subject).not_to eq(other)
		end

		it "not equal when ip is different" do
			other = described_class.new(path: "/about", ip: "127.0.0.1")
			expect(subject).not_to eq(other)
		end

	end

	describe "#hash" do
		
		it "not to return nil" do
			expect(subject.hash).not_to be_nil
		end

		it "two equal lines have same hash" do
			other = described_class.new(path: "/about", ip: "192.168.0.2")
			expect(subject.hash).to eq(other.hash)
		end

	end

end
