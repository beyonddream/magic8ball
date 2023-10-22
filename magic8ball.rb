# frozen_string_literal: true

class Magic8Ball

    def initialize(answers_file_path:File.join(File.dirname(__FILE__), 'answers.txt'), consistency:false)
        @answers = []
        File.open(answers_file_path).each do |answer|
            @answers.push(answer.chomp)
        end
        @consistency = consistency
    end

    def ask(question="")
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