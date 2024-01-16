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

          new(red: values[0], green: values[1], blue: values[2])
        end

        def <=(other)
          @red <= other.red && @green <= other.green && @blue <= other.blue
        end

        alias lte? <=

        def to_s
          "Draw(#{@red}, #{@green}, #{@blue})"
        end

      end

    end
  end
end
