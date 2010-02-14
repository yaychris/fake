require "rubygems"
require "shoulda"
require "mocha"
require "fake"


# http://thinkingdigitally.com/archive/capturing-output-from-puts-in-ruby/
require 'stringio'
module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end

class Test::Unit::TestCase
  def execute(args = nil)
    args ||= ""
    args = args.split(" ")
    @stdout = capture_stdout do
      Fake.execute(args)
    end
  end
end
