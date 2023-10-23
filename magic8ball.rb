# frozen_string_literal: true

##
# This class represents the Magic 8 Ball.
#
class Magic8Ball

    # Public: Setup magic 8 ball.
    #
    # answers_file_path - path to a file which contains list of possible answers.
    #   Defaults to the file within the app directory.
    #
    # consistency - If true, then same question will always yield same random answer.
    #   If not, it returns a random answer everytime even for same question.
    #
    # Returns nothing.
    def initialize(answers_file_path:File.join(File.dirname(__FILE__), 'answers.txt'), consistency:false)
        @answers = []
        File.open(answers_file_path).each do |answer|
            @answers.push(answer.chomp)
        end
        @consistency = consistency
    end

    # Public: Main method to ask a question to magic 8 ball.
    #
    # question - question that is asked to magic 8 ball. Cannot be nil.
    #
    # Returns the answer.
    def ask(question=nil)
        return "You must ask a question!" unless question
        if @consistency
            hash = 0
            question.split.each do |word|
                hash += word.ord
            end
            return @answers[hash % (@answers.length() - 1)]
        else
            return @answers[rand(0..(@answers.length() - 1))]
        end
    end
end