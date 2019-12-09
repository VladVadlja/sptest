# frozen_string_literal: true

require 'line'
require 'result'
require 'terminal_output'

RSpec.describe TerminalOutput do
  let(:line) { Line.new(path: '/about', ip: '192.168.0.2') }
  let(:store) { DataStore.new }

  subject { described_class.new }

  describe '#show_analytics' do
    it 'will print page hits title' do
      store.load(line)
      store.load(line)
      subject.data_store = store.results
      expect { subject.show_analytics }.to output.to_stdout
    end

    it 'will print unique visits title' do
      store.load(line)
      store.load(line)
      subject.data_store = store.results
      expect { subject.show_analytics }.to output(
        <<~END
          Most visited pages:
          +--------+-----------+
          | Path   | # of hits |
          +--------+-----------+
          | /about | 2         |
          +--------+-----------+

          Pages with most unique visits:
          +--------+---------------+
          | Path   | # unique hits |
          +--------+---------------+
          | /about | 1             |
          +--------+---------------+

        END
      ).to_stdout
    end
  end
end
