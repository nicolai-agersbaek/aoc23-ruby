# frozen_string_literal: true

require_relative "../../test_helper"
require "aoc23/solutions/day1"

module Aoc23
  module Solutions
    class Day1Test < Minitest::Test

      def test_solve
        data = %w[1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet]

        assert_equal 142, Day1.new.solve(input: data)
      end

      def test_solve_line
        cases = {
          "1abc2" => 12,
          "pqr3stu8vwx" => 38,
          "a1b2c3d4e5f" => 15,
          "treb7uchet" => 77,
        }

        cases.each { |k, v| assert_equal v, Day1.new.solve_line(k) }
      end
    end
  end
end
