# frozen_string_literal: true

class Analyzer
  attr_reader :filename, :parser

  def initialize(filename:, parser: Parser.new)
    @filename = filename
    @parser = parser
  end

  def start
    raise FileNotFoundError if @filename.nil? || !File.exist?(@filename)

    File.foreach(@filename) do |file_line|
      line_array = file_line.split
      line = Line.new(path: line_array[0], ip: line_array[1])
      @parser.parse(line)
    end

    show_analytics
  rescue FileNotFoundError
    puts "File #{@filename} not found!"
  end

  private

  def show_analytics
    show_page_hits
    show_page_unique_hits
  end

  def show_page_hits
    puts 'Most visited pages:'
    print_hits
    puts
  end

  def show_page_unique_hits
    puts 'Pages with most unique visits:'
    print_unique_hits
    puts
  end

  def print_hits
    ordered = @parser.results.sort_by { |_path, result| result.counters[:hits] }.reverse
    ordered.each do |path, result|
      puts "#{path} #{result.counters[:hits]} visits"
    end
  end

  def print_unique_hits
    ordered = @parser.results.sort_by { |_path, result| result.counters[:unique_hits] }.reverse
    ordered.each do |path, result|
      puts "#{path} #{result.counters[:unique_hits]} views"
    end
  end
end
