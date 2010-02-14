require "test_helper"

class RunnerTest < Test::Unit::TestCase
  context "with no arguments" do
    should "print the help text" do
      execute
      assert_equal "help\n", @stdout.string
    end
  end

  context "with one argument" do
    context "that is invalid" do
      should "print an error message" do
        execute "blah"
        assert_equal "  unknown command: blah\n", @stdout.string
      end
    end

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

    # name
    %w(name names).each do |arg|
      context "'#{arg}'" do
        should "print a name" do
          name = "John Johnson\n"
          Faker::Name.expects(:name).returns(name)

          execute(arg)
          assert_equal name, @stdout.string
        end
      end
    end

    # phone number
    ["phone number", "phone numbers"].each do |arg|
      context "'#{arg}'" do
        should "print a phone number" do
          number = "123 456 7890\n"
          Faker::PhoneNumber.expects(:phone_number).returns(number)

          execute(arg)
          assert_equal number, @stdout.string
        end
      end
    end

    # email address
    ["email", "emails", "email address", "email addresses"].each do |arg|
      context "'#{arg}'" do
        should "print an email address" do
          email = "john@johnson.com\n"
          Faker::Internet.expects(:email).returns(email)

          execute(arg)
          assert_equal email, @stdout.string
        end
      end
    end
  end

  context "when repeating" do
    should "output multiple times" do
      num = rand(10) + 1
      sentence = "Test sentence"
      Faker::Lorem.expects(:sentence).times(num).returns(sentence)
      execute "#{num} sentences"
      assert_equal ("#{sentence}\n" * num), @stdout.string
    end
  end
end
