# encoding: utf-8
require 'uri'
require 'rss'
require 'time'

module EndiFeed
  # This module contains various useful functions.
  module Util
    def self.included(base)
      base.extend self
    end

    module_function

    # Fetches and parses RSS feed
    # @param [String] url to parse
    # @return [RSS] parsed XML feed or nil
    def parse_feed(url = 'http://www.elnuevodia.com/rss/noticias.xml')
      open(url) do |rss|
        RSS::Parser.parse(rss)
      end
    end

    # Converts HTTP-date (RFC 2616) into a simpler date format
    # @param date [Date, String] only Date or String
    # @return [String] parsed date (mm/dd/yyyy)
    def convert_date(date)
      date = String(date)
      Time.parse(date).strftime('%x')
    end

    # Converts HTTP-date (RFC 2616) into the 12-hour format
    # @param date [Date, String] only Date or String
    # @return [String] parsed time (HH:MM:SS AM|PM)
    def convert_time(date)
      date = String(date)
      Time.parse(date).strftime('%r')
    end
  end
end