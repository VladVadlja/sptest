require 'line'

RSpec.describe Line do
  subject { described_class.new(path: '/about', ip: '192.168.0.2') }

  describe 'initialization' do
    it 'can be initialized' do
      expect(described_class).not_to be_nil
    end

    it 'responds to getter for path attribute' do
      expect(subject).to respond_to(:path)
    end

    it 'responds to getter for ip attribute' do
      expect(subject).to respond_to(:ip)
    end

    it 'doesn\'t have writter for path attribute' do
      expect(subject).not_to respond_to(:path=)
    end

    it 'doesn\'t have writter for ip attribute' do
      expect(subject).not_to respond_to(:ip=)
    end

    it 'read path attribute' do
      expect(subject.path).to eq('/about')
    end

    it 'read ip attribute' do
      expect(subject.ip).to eq('192.168.0.2')
    end
  end

end
