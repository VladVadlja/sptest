#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '.', 'lib'))
require 'analyzer'
require 'parser'
require 'line'
require 'result'
require 'file_not_found_error'

filename = ARGV[0]
Analyzer.new(filename: filename).start
