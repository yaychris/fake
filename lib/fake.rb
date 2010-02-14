require "faker"

module Fake
  VERSION = "0.0.1"

  extend self

  def execute(args)
    return print_help unless args.size > 0
  end

  def print_help
    puts "help"
  end
end
