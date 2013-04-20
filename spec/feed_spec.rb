require 'feed'

describe Feed do
  describe '#to_s' do
    subject { Feed.new('./spec/episodes') }

    it "returns an RSS feed" do
      subject.to_s.should match(/rss/)
    end
  end
end
