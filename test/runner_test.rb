require "test_helper"

class RunnerTest < Test::Unit::TestCase
  context "with no arguments" do
    should "print the help text" do
      execute
      assert_equal "help\n", @stdout.string
    end
  end

  context "with one argument" do
    # help
    %w(-h --help help).each do |arg|
      context "'#{arg}'" do
        should "print the help text" do
          execute(arg)
          assert_equal "help\n", @stdout.string
        end
      end
    end

    # sentence
    %w(sentence sentences).each do |arg|
      context "'#{arg}'" do
        should "print a sentence" do
          sentence = "Test sentence\n"
          Faker::Lorem.expects(:sentence).returns(sentence)

          execute(arg)
          assert_equal sentence, @stdout.string
        end
      end
    end

    # paragraph
    %w(paragraph paragraphs).each do |arg|
      context "'#{arg}'" do
        should "print a paragraph" do
          paragraph = "Test paragraph\n"
          Faker::Lorem.expects(:paragraph).returns(paragraph)

          execute(arg)
          assert_equal paragraph, @stdout.string
        end
      end
    end
  end
end
