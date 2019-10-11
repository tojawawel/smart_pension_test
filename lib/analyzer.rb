# frozen_string_literal: true

require_relative 'parser'

class Analyzer
  def initialize(file)
    @array_of_logs = Parser.new.parse(file)
  end

  def all_views
    get_views('all views')
  end

  def unique_views
    get_views('unique')
  end

  private

  def empty_logs?
    @array_of_logs.empty?
  end

  def get_views(method)
    return 'No logs inside' if empty_logs?

    views = {}

    @array_of_logs.each { |log| views[log[0]] = views[log[0]].to_i + 1 } if method == 'all views'
    @array_of_logs.uniq.each { |log| views[log[0]] = views[log[0]].to_i + 1 } if method == 'unique'

    views.sort_by { |_k, v| -v }.to_h
  end
end
