require "faker"

module Fake
  VERSION = "0.0.1"

  extend self

  def execute(args)
    if args.empty? || args.any? { |arg| %w( -h --help help ).include?(arg) }
      return show_help 
    end

    case args.join(" ")
    when /^sentences?$/
      puts Faker::Lorem.sentence
    when /^paragraphs?$/
      puts Faker::Lorem.paragraph
    when /^names?$/
      puts Faker::Name.name
    when /^phone numbers?$/
      puts Faker::PhoneNumber.phone_number
    when /^emails?$/, /^email address(?:es)?$/
      puts Faker::Internet.email
    else
      show_invalid_message(args.join(" "))
    end
  end

  def show_help
    puts "help"
  end

  def show_invalid_message(command)
    puts "  unknown command: #{command}"
  end
end
