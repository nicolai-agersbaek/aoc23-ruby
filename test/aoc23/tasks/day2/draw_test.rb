# frozen_string_literal: true

require_relative "../../../test_helper"
require "aoc23/tasks/day2/draw"

module Aoc23
  module Tasks
    module Day2
      class DrawTest < Minitest::Test
        def setup
          # Do nothing
        end

        def teardown
          # Do nothing
        end

        def test_lte
          data_set = [
            [[0,0,0], [1,1,1], true],
            [[1,1,1], [1,1,1], true],
            [[2,2,2], [1,1,1], false],
            [[2,0,0], [1,1,1], false],
            [[0,2,0], [1,1,1], false],
            [[0,0,2], [1,1,1], false],
          ]

          data_set.each { |data| lte_test *data }
        end

        private

        def lte_test(first, second, expected)
          a = Draw.new(red: first[0], green: first[1], blue: first[2])
          b = Draw.new(red: second[0], green: second[1], blue: second[2])

          assert_equal expected, a <= b
        end
      end
    end
  end
end
