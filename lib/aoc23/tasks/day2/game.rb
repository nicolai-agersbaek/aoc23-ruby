# frozen_string_literal: true

module Aoc23
  module Tasks
    module Day2

      class Game

        attr_reader :draws

        def initialize(draws)
          @draws = draws
        end

        def self.from_a(draws)
          new(draws.map { |draw| Draw.from_a(draw) })
        end

        def possible?(max_draw)
          @draws.all? { | draw | draw <= max_draw }
        end

        def <=(other)
          @draws.zip(other)
                .all? { | pair | pair[0] <= pair[1] }
        end

        alias lte? <=

        def to_s
          str = @draws.map(&:to_s).join(", ")

          "Game(#{str})"
        end

      end

    end
  end
end
