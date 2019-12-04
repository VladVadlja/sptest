# frozen_string_literal: true

require 'set'
require 'result'

class Parser
  attr_reader :results

  def initialize(results: {}, unique_lines: Set.new)
    @results = results
    @unique_lines = unique_lines
  end

  def parse(line)
    add_line(line) if line.valid?
  end

  def result(line)
    @results[line.to_sym]
  end

  def add_line(line)
    add_visit(line)
    add_unique(line)
  end

  private

  def add_visit(line)
    create_result(line)
    @results[line.to_sym].hits_increment
  end

  def create_result(line)
    @results[line.to_sym] ||= Result.new
  end

  def add_unique(line)
    return if @unique_lines.include? line

    @unique_lines << line
    create_result(line)
    @results[line.to_sym].unique_increment
  end
end
