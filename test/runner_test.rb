require "test_helper"

class RunnerTest < Test::Unit::TestCase
  context "Running a command" do

    context "with no arguments" do
      should "print the help text" do
        out = capture_stdout do
          Fake.execute([])
        end
        assert_equal "help\n", out.string
      end
    end

  end
end
