require "faker"
require "fake/help"

module Fake
  VERSION = "0.0.1"

  extend self

  def execute(args)
    if args.empty? || args.any? { |arg| %w( -h --help help ).include?(arg) }
      return show_help 
    end

    num, klass, method = parse_command(args)

    if num && klass && method
      num.times do
        puts klass.send(method)
      end
    else
      show_error(args)
    end
  end

  def parse_command(args)
    # parse repetition
    num = if args[0] =~ /^\d+$/
      args.slice!(0).to_i
    else
      1
    end

    # parse command
    command = case args.join(" ")
    when /^sentences?$/
      [Faker::Lorem, :sentence]
    when /^paragraphs?$/
      [Faker::Lorem, :paragraph]
    when /^names?$/
      [Faker::Name, :name]
    when /^phones?$/, /^phone numbers?$/
      [Faker::PhoneNumber, :phone_number]
    when /^emails?$/, /^email address(?:es)?$/
      [Faker::Internet, :email]
    end

    [num, command].flatten
  end

  def show_help
    puts HELP
  end

  def show_error(command)
    puts "  unknown command: #{command}"
  end
end
