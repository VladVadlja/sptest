# frozen_string_literal: true

class Result
  attr_reader :counters

  def initialize
    @counters = Hash.new(0)
  end

  def hits_increment
    counters[:hits] += 1
  end

  def unique_increment
    counters[:unique_hits] += 1
  end
end
