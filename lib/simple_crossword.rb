require "puzzle_maker/version"
require 'byebug'

module PuzzleMaker
  class SimpleCrossword

    attr_reader :available_answers, :result, :selected_answers

    def initialize(result:, available_answers:)
      @result            = result
      @available_answers = available_answers
      @selected_answers = nil
    end

    def generate
      select_answers
      self
    end

    def select_answers
      if available_answers.empty?
        @selected_answers = []
        return @selected_answers
      end

      available_answers.each do |answer|
        matching_position = answer.index(result)
        if matching_position
          @selected_answers = [SelectedAnswer.new(answer, matching_position)]
        end
      end
      @selected_answers
    end
  end

  class SelectedAnswer

    attr_reader :word, :matching_position

    def initialize(word, matching_position)
      @word = word
      @matching_position = matching_position + 1
    end

    def length
      @word.length
    end
  end
end
