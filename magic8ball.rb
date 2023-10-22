#!/usr/bin/env ruby

class Magic8Ball

    def initialize(consistency=false, answers_file_path="./answers.txt")
        @consistency = consistency
        @answers = []
        File.open(answers_file_path).each do |answer|
            @answers.push(answer)
        end
    end

    def ask(question="")
        return "You must ask a question!" unless question
        if consistency
            return answers[0]
        else
            return answers[rand(0..(answers.length()-1))]
        end
    end
end