# frozen_string_literal: true

require_relative 'parser'

class Analyzer
  def initialize(file)
    @array_of_logs = Parser.new.parse(file)
  end

  def all_views
    return 'No logs inside' if empty_logs?

    all_views = {}

    @array_of_logs.each { |log| all_views[log[0]] = all_views[log[0]].to_i + 1 }
    all_views.sort_by { |_k, v| -v }.to_h
  end

  def unique_views
    return 'No logs inside' if empty_logs?

    unique_views = {}

    @array_of_logs.uniq.each { |log| unique_views[log[0]] = unique_views[log[0]].to_i + 1 }
    unique_views.sort_by { |_k, v| -v }.to_h
  end

  private

  def empty_logs?
    @array_of_logs.empty?
  end
end
