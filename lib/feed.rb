require 'erb'
require 'episode'

class Feed
  include ERB::Util

  TEMPLATE = './lib/template.xml.erb'
  EPISODE_DIR = './episodes'

  def initialize(directory)
  end

  def to_s
    file = File.new(TEMPLATE)
    ERB.new(file.read).result(binding)
  end

  def podcast_episodes
    return @episodes if @episodes
    @episodes = episode_files.collect do |file|
      Episode.new(file)
    end.reverse
  end

  def episode_files
    Dir["#{EPISODE_DIR}/*.md"]
  end
end
