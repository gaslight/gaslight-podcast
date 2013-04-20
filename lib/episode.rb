require 'rdiscount'
require 'time'
require 'yaml'

class Episode
  attr_reader :title, :body, :date, :link

  def initialize(path)
    file = File.new(path)
    data = read_file(file)

    @title = data["title"]
    @date = Time.parse(data["date"])
    @link = data["link"]
    @body = RDiscount.new(data["body"]).to_html
  end

  def read_file(file)
    if File.read(file) =~ /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m
      data = YAML.load($1)
      data["body"] = $'
      data
    else
      raise "No YAML front matter found for file #{file.path}"
    end
  end
end
