# frozen_string_literal: true

require_relative 'magic8ball'
require 'minitest/autorun' 

class Magic8BallTest < MiniTest::Test

    def test_empty_question
        magic8ball = Magic8Ball.new
        answer = magic8ball.ask
        assert_equal "You must ask a question!", answer
    end
    
    def test_consistency
      magic8ball = Magic8Ball.new(consistency:true)
      # try enough times to be confident we are not seeing random answers to same question
      20.times do
        answer = magic8ball.ask("Will I win the eurovision ?")
        assert_equal "Without a doubt", answer
      end
    end
end