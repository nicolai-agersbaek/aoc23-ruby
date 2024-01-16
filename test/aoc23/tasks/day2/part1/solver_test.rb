# frozen_string_literal: true

require_relative "../../../../test_helper"
require "aoc23/tasks/day2/part1/solver"
require "aoc23/tasks/day2/game"
require "aoc23/tasks/day2/draw"

module Aoc23
  module Tasks
    module Day2
      class SolverTest < Minitest::Test
        def setup
          @solver = Solver.new Draw.new(red: 10, green: 10, blue: 10)
        end

        def test_parse_draws_string
          data_set = {
            "3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green" => Game.from_a([[4, 0, 3], [1, 2, 6], [0, 2, 0]]),
            "1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue" => Game.from_a([[0, 2, 1], [1, 3, 4], [0, 1, 1]]),
            "8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red" => Game.from_a([[20, 8, 6], [4, 13, 5], [1, 5, 0]]),
            "1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red" => Game.from_a([[3, 1, 6], [6, 3, 0], [14, 3, 15]]),
            "6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green" => Game.from_a([[6, 3, 1], [1, 2, 2]]),
          }

          data_set.each_pair.each do |draws_str, expected|
            actual = @solver.parse_draws_string draws_str

            assert_equal expected.to_s, actual.to_s, "Failed for draws_str: '#{draws_str}"
          end
        end

        def test_solve_line
          data_set = {
            "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green" => 1,
            "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue" => 2,
            "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red" => 0,
            "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red" => 0,
            "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green" => 5,
          }

          data_set.each_pair.each do |line, expected|
            actual = @solver.solve_line line

            assert_equal expected, actual, "Failed for line: '#{line}"
          end
        end
      end
    end
  end
end
