# frozen_string_literal: true

class Analyzer
  attr_reader :filename, :data_store, :output

  def initialize(filename:, data_store: DataStore.new, output: TerminalOutput.new)
    @filename = filename
    @data_store = data_store
    @output = output
  end

  def start
    raise FileNotFoundError if filename.nil? || !File.exist?(filename)

    File.foreach(filename) do |file_line|
      line_array = file_line.split
      line = Line.new(path: line_array[0], ip: line_array[1])
      data_store.load(line)
    end

    output.data_store = data_store.results
    output.show_analytics
  rescue FileNotFoundError
    puts "File #{filename} not found!"
  end
end
