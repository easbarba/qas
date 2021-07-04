# frozen_string_literal: true

require 'pathname'
require 'uri'

module Floss
  # Provides Project Information
  class ProjectInfo
    attr_reader :url, :name, :folder

    def initialize(url, language)
      @url = URI.parse url
      @language = language
      @name = File.basename(@url.path.split('/').last, '.git')
      projects = Pathname.new(File.join(Dir.home, 'Projects'))
      @folder = projects.join language, name
    end

    def to_s
      <<~INFO
          repository: #{url}
          folder: #{folder}
        INFO
    end
  end
end
