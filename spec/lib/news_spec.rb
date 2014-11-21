# encoding: utf-8
require 'spec_helper'

describe EndiFeed::News do
  let(:news) { EndiFeed::News.new }

  before :each do
    stub_request(:get, 'http://www.elnuevodia.com/rss/noticias.xml')
      .with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'})
      .to_return(:status => 200, :body => fixture('noticias.xml'), :headers => {})

    stub_request(:post, "https://www.googleapis.com/urlshortener/v1/url")
      .to_return(:status => 200, :body => "http://goo.gl/fbsS", :headers => {})
  end

  describe '.title' do
    it 'returns title of the feed' do
      expect(news.title).to eq('El Nuevo Dia : Noticias')
    end
  end

  describe '.site_url' do
    it 'returns the url of the site' do
      expect(news.site_url).to eq('http://www.elnuevodia.com/')
    end
  end

  describe '.last_update' do
    it 'returns the last update time of the feed' do
      expect(news.last_update).to eq('09:52:01 AM')
    end
  end

  describe '.get_headlines' do
    it 'returns formatted news' do
      expect(news.get_headlines(2).size).to eq(4)
    end

    it 'returns error msg when something goes wrong' do
      expect(news.get_headlines('ee')).to eq('Problem retrieving news headlines.')
    end
  end

  describe '.format_header_text' do
    it 'formats the header text' do
      expect(news.format_header_text([]))
      .to eq(['El Nuevo Dia : Noticias (http://www.elnuevodia.com/)', 'Última actualización: 09:52:01 AM'])
    end
  end
end
