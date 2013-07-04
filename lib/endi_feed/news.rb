# encoding: utf-8
require 'link_shrink'

module EndiFeed
  # This class cleans up and formats XML/RSS feed.
  class News
    include EndiFeed::Util

    # Loads initial data
    #   sets @headlines ivar
    #   and calls :news_feed, :channel methods
    #
    # @see #news_feed
    # @see #channel
    def initialize
      @headlines = []
      news_feed
      channel
    end

    # Factory method that gets the news
    #
    # @see EndiFeed::Util.convert_date
    # @see #format_header_text
    # @see #process_news
    # @see #format_headline
    #
    # @param total [Integer] total of news to fetch
    # @return [Array<String>] news or an error message
    def get_headlines(total)
      process_news(total)
      format_header_text(@headlines)
    rescue
      'Problem retrieving news headlines.'
    end

    # Loads news into instance variable
    #
    #   @see EndiFeed::Util.parse_feed
    # @return [RSS] parsed XML feed or nil
    def news_feed
      @news_feed ||= parse_feed
    end

    # Convenience method for feed channel
    def channel
      @channel ||= @news_feed.channel
    end

    # Convenience method for items in feed
    def items
      @news_feed.items
    end

    # Returns the title from the feed
    # @return [String] newspaper site title
    def title
      @channel.title
    end

    # Returns the site's url from the feed
    # @return [String] newspaper site URL
    def site_url
      @channel.link
    end

    # Returns the last update time of the feed
    # @return [String] last update time
    def last_update
      convert_time(@channel.pubDate)
    end

    # Applies formatting to header text
    # @return [Array<String>] formatted header text
    def format_header_text(headlines)
      sub_title    = "Última actualización: #{ last_update }"
      header_title = "#{ title } (#{ site_url })"
      headlines.unshift(header_title, sub_title)
    end

    private

    # Applies formatting to headline and shrinks urls
    # @return [String] formatted news headline
    def format_headline(item, num)
      ''.concat("#{ num.next }. #{ item.title } ")
      .concat("(#{ convert_date(item.pubDate) })")
      .concat(" - #{ LinkShrink.shrink_url(item.link) }")
    end

    # Handles iteration of each headline
    # @return [Array<String>] news headlines
    def process_news(total = 25)
      items.map.with_index do |item, num|
        @headlines << format_headline(item, num) if total_met?(total)
      end.compact || nil
    end

    # Returns true when total is reached
    # @return [TrueClass, FalseClass]
    def total_met?(total)
      @headlines.length < Integer(total)
    end
  end
end