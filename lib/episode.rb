require 'rdiscount'
require 'time'
require 'yaml'

class Episode
  TITLE_PREFIX = 'Gaslight Podcast #'

  def initialize(path)
    @path = path
    @data = read_file(@path)
  end

  def title
    "#{TITLE_PREFIX}#{episode_number}: #{@data['title']}"
  end

  def body
    RDiscount.new(@data["body"]).to_html
  end

  def date
    Time.parse(@data["date"])
  end

  def link
    @data["link"]
  end

  def guid
    @data["guid"] || @data["link"]
  end

  private

  def episode_number
    File.basename(@path, '.md').to_i
  end

  def read_file(path)
    if File.read(path) =~ /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m
      data = YAML.load($1)
      data["body"] = $'
      data
    else
      raise "No YAML front matter found for file #{path}"
    end
  end
end
