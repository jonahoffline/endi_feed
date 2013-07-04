# encoding: utf-8
require 'spec_helper'

describe EndiFeed do
  let(:endi) { EndiFeed }

  before :each do
    stub_request(:get, 'http://www.elnuevodia.com/rss/noticias.xml')
    .with(:headers => { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
    .to_return(:status => 200, :body => fixture('noticias.xml'), :headers => {})

    stub_request(:post, 'https://www.googleapis.com/urlshortener/v1/url')
    .with(:headers => { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
    .to_return(:status => 200, :body => 'http://goo.gl/fbsS', :headers => {})
  end

  describe '.get_news' do
    it 'delegates to ::News.new.get_headlines' do
      expect(endi.get_news(2).size).to eq(4)
    end
  end
end