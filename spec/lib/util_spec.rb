# encoding: utf-8
require 'spec_helper'

describe EndiFeed::Util do
  let(:util) { EndiFeed::Util }

  before :each do
    stub_request(:get, 'http://www.elnuevodia.com/rss/noticias.xml')
    .with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'})
    .to_return(:status => 200, :body => fixture('noticias.xml'), :headers => {})

    stub_request(:post, "https://www.googleapis.com/urlshortener/v1/url")
      .to_return(:status => 200, :body => "http://goo.gl/fbsS", :headers => {})
  end

  describe '.parse_feed' do
    it 'returns an RSS::Rss instance' do
      expect(util.parse_feed).to be_kind_of(RSS::Rss)
    end
  end

  describe '.convert_date' do
    it 'converts HTTP-date into a mm/dd/yy parsed date' do
      expect(util.convert_date('Sat, 29 Jun 2013 16:27:33 GMT'))
      .to eq('06/29/13')
    end
  end

  describe '.convert_time' do
    it 'converts HTTP-date into a 12-hour parsed time' do
      expect(util.convert_time('Sat, 29 Jun 2013 16:27:33 GMT'))
      .to eq('04:27:33 PM')
    end
  end
end
