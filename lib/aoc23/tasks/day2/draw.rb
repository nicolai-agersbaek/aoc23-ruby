# frozen_string_literal: true

module Aoc23
  module Tasks
    module Day2

      class Draw

        attr_reader :red, :green, :blue

        def initialize(red:, green:, blue:)
          @red = red
          @green = green
          @blue = blue
        end

        def self.from_a(values)
          if values.size != 3
            raise ArgumentError.new "values must be an Array[int] of size 3"
          end

          new(*values)
        end

        def <=(other)
          @red <= other.red && @green <= other.green && @blue <= other.blue
        end

        alias lte? <=

      end

    end
  end
end
