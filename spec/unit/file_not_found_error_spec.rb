
require 'file_not_found_error'

RSpec.describe FileNotFoundError do
	subject { described_class.new }

	describe 'initialization' do
		it 'is standard error' do
			expect(subject.class.superclass).to eq(StandardError)
		end

		it 'containes message' do
			expect(subject.message).to eq({msg: "File not found!"}.to_s)
		end

		context 'with custom message' do
			it 'can be instantiated' do
				other = described_class.new(msg: "Custom Message!")
				expect(other.message).to eq({msg: "Custom Message!"}.to_s)
			end
		end
	end
end
