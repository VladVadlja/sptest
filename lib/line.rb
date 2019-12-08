# frozen_string_literal: true

class Line
  attr_reader :path, :ip

  def initialize(path:, ip:)
    @path = path
    @ip = ip
  end

  def valid?
    !path.nil? && !ip.nil?
  end

  def ==(other)
    path == other.path &&
      ip == other.ip
  end

  alias eql? ==

  def hash
    [path, ip].hash
  end

  def to_sym
    path.to_sym
  end
end
