# encoding: utf-8
require 'optparse'

module EndiFeed
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # A Simple class for the executable version of the gem
  class CLI

    # @param args [Array<String>] The command-line arguments
    def initialize(args)
      @args = args
    end

    # Configures the arguments for the command
    # @param opts [OptionParser]
    def set_options(opts)
      @total_news  = 25
      opts.version = EndiFeed::VERSION
      opts.banner  = <<MSG
Usage: endifeed [options] [arguments]
Description:
  EndiFeed, get the latest news from endi.com / El Nuevo Dia Newspaper.

Options:
MSG
      opts.set_program_name 'EndiFeed'
      opts.on('-n [total]', Integer, '--news', 'total of news to fetch') do |total|
        @total_news = total
      end

      opts.on_tail('-v', '--version', 'display the version of EndiFeed') do
        puts opts.version
        exit
      end

      opts.on_tail('-h', '--help', 'print this help') do
        puts opts.help
        exit
      end
    end

    # Parses the command-line arguments and runs the executable
    # @return [String] The short url or argument passed
    def parse
      opts = OptionParser.new(&method(:set_options))
      opts.parse!(@args)
      get_news
    end

    private
    def get_news
      EndiFeed.get_news(@total_news)
    end
  end
end