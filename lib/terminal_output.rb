# frozen_string_literal: true

class TerminalOutput
  attr_accessor :data_store

  def initialize(data_store: nil)
    @data_store = data_store
  end

  def show_analytics
    show_page_hits
    show_page_unique_hits
  end

  private

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
    ordered = data_store.sort_by { |_path, result| result.counters[:hits] }.reverse
    ordered.each do |path, result|
      puts "#{path} #{result.counters[:hits]} visits"
    end
  end

  def print_unique_hits
    ordered = data_store.sort_by { |_path, result| result.counters[:unique_hits] }.reverse
    ordered.each do |path, result|
      puts "#{path} #{result.counters[:unique_hits]} views"
    end
  end
end
