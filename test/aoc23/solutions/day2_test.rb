# frozen_string_literal: true

require_relative "../../test_helper"
require "aoc23/solutions/day2"

module Aoc23
  module Solutions
    class Day1Test < Minitest::Test

      def setup
        super
        @day2 = Day2.new(red: 12, green: 13, blue: 14)
      end

      # def test_solve
      #   data = %w[1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet]
      #
      #   assert_equal 142, @day2.solve(input: data)
      # end

      def test_solve_line
        cases = {
          "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green" => 1,
          "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue" => 2,
          "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red" => 0,
          "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red" => 0,
          "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green" => 5,
        }

        cases.each { |k, v| assert_equal v, @day2.solve_line(k) }
      end
    end
  end
end
