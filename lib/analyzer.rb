# frozen_string_literal: true

require_relative 'parser'

class Analyzer
  def initialize(file)
    @array_of_logs = Parser.new.parse(file)
  end

  def all_views
    return 'No logs inside' if empty_logs?
  end

  private

  def empty_logs?
    @array_of_logs.empty?
  end
end
