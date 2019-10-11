# frozen_string_literal: true

class Parser
  def parse(file)
    raise 'No such file' unless file_exists?(file)

    array_of_logs = []
    File.open(file).each { |line| array_of_logs << line.split(' ') }
    array_of_logs
  end

  private

  def file_exists?(file)
    File.exist?(file)
  end
end
