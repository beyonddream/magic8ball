# frozen_string_literal: true

require_relative 'magic8ball'
require 'minitest/autorun' 

class Magic8BallTest < MiniTest::Test

    def test_consistency
      magic8ball = Magic8Ball.new(consistency:true)
      answer = magic8ball.ask("Will I win the eurovision ?")
      assert_equal "Without a doubt", answer
    end
end