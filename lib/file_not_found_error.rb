# frozen_string_literal: true

# Custom error when file is not found
class FileNotFoundError < StandardError
  def initialize(msg: 'File not found!')
    super
  end
end
