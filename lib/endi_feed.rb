# encoding: utf-8
require 'endi_feed/version'
require 'endi_feed/util'
require 'endi_feed/news'
require 'endi_feed/cli'

# @author Jonah Ruiz <jonah@pixelhipsters.com>
# Contains modules and classes to parse the news feed
# from endi.com / El Nuevo Dia Newspaper
module EndiFeed
  # Creates an EndiFeed::News instance and calls :get_headlines
  # @return [Array<String>] news headlines
  def self.get_news(total = 25)
    EndiFeed::News.new.get_headlines(total)
  end
end