# frozen_string_literal: true

require_relative 'lib/analyzer'

logs_analyze = Analyzer.new(ARGV[0])

puts 'All views:'
puts logs_analyze.all_views
puts 'Unique views:'
puts logs_analyze.unique_views
