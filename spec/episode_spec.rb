require 'time'
require 'episode'

describe "Episode" do
  describe ".to_rss_item" do
    let(:episode_path) { './spec/episodes/015.md' }
    subject { Episode.new(episode_path) }

    it "provides information for an rss feed item" do
      subject.date.should == Time.parse('04/11/2013 08:29')
      subject.link.should == 'http://example/test.mp3'
      subject.body.should == "<p>This is <em>the</em> episode description content.</p>\n"
    end

    it "generates a title with a prefix and the episode number" do
      subject.title.should == 'Gaslight Podcast #15: Episode Title'
    end
  end
end
