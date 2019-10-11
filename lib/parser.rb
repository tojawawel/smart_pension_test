# frozen_string_literal: true

class Parser
  def parse(file)
    raise 'No such file' unless file_exists?(file)
  end

  private

  def file_exists?(file)
    File.exist?(file)
  end
end
