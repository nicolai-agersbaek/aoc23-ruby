# frozen_string_literal: true

require_relative "../../../test_helper"
require "aoc23/tasks/day2/solver"
require "aoc23/tasks/day2/game"
require "aoc23/tasks/day2/draw"

module Aoc23
  module Tasks
    module Day2
      class SolverTest < Minitest::Test
        def setup
          @solver = Solver.new Draw.new(red: 10, green: 10, blue: 10)
        end

        def test_solve_line
          data_set = {
            "Game 1: 1 red, 2 green, 3 blue; 4 red, 5 green, 6 blue" => 1,
            "Game 13: 1 red, 2 green, 3 blue; 4 red, 5 green, 6 blue" => 13,
            "Game 16: 1 red, 2 green, 3 blue; 4 red, 5 green, 60 blue" => 0,
          }

          data_set.each_pair.each do |line, expected |
            actual = @solver.solve_line line

            assert_equal expected, actual, "Failed for line: '#{line}"
          end
        end
      end
    end
  end
end
