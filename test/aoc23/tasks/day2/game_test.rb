# frozen_string_literal: true

require_relative "../../../test_helper"
require "aoc23/tasks/day2/game"
require "aoc23/tasks/day2/draw"

module Aoc23
  module Tasks
    module Day2
      class GameTest < Minitest::Test
        def setup
          # Do nothing
          @game = Game.from_a([
                               [1, 2, 3],
                               [3, 1, 2],
                               [2, 3, 1],
                             ])
        end

        def test_possible?
          data_set = [
            {
              required_draw: Draw.from_a([0, 0, 0]),
              expected: true,
            },
            {
              required_draw: Draw.from_a([1, 1, 1]),
              expected: true,
            },
            {
              required_draw: Draw.from_a([2, 1, 1]),
              expected: false,
            },
            {
              required_draw: Draw.from_a([1, 2, 1]),
              expected: false,
            },
            {
              required_draw: Draw.from_a([1, 1, 2]),
              expected: false,
            },
          ]

          data_set.each { |data| possible_test **data }
        end

        private

        def possible_test(required_draw:, expected:)
          actual = @game.possible?(required_draw)

          assert_equal expected, actual
        end
      end
    end
  end
end
