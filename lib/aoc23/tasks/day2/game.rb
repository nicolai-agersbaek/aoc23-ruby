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
          new(*draws.map { |draw| Draw.from_a(draw) })
        end

        def possible?(required_draw)
          @draws.all? { | draw | required_draw <= draw }
        end

        def <=(other)
          @draws.zip(other)
                .all? { | pair | pair[0] <= pair[1] }
        end

        alias lte? <=

      end

    end
  end
end
