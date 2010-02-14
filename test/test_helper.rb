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

