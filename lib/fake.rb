require "faker"

module Fake
  VERSION = "0.0.1"

  extend self

  def execute(args)
    if args.empty? || args.any? { |arg| %w( -h --help help ).include?(arg) }
      return show_help 
    end

    case args[0]
    when /sentence/
      puts Faker::Lorem.sentence
    end
  end

  def show_help
    puts "help"
  end
end
