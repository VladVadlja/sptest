# frozen_string_literal: true

class FileNotFoundError < StandardError
  def initialize(msg: 'File not found!')
    super
  end
end
