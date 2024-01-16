# frozen_string_literal: true

require_relative "../solver"
require_relative "draw"
require_relative "game"

module Aoc23
  module Tasks
    module Day2

      class Solver

        attr_reader :max_draw

        def initialize(max_draw)
          @max_draw = max_draw
        end

        def self.default
          DEFAULT
        end

        def solve(input)
          input.map { |line| solve_line(line) }
               .sum
        end

        # MatchData.define_method(:fetch) do |key|
        #   value = self[key]
        #
        #   if value.nil?
        #     raise IndexError.new "No match found for key: #{key} in: #{line}"
        #   end
        #
        #   value
        # end

        def solve_line(line)
          matches = line.match(/^Game (?<game_id>\d+): (?<draws>.+)/)

          game_id = matches[:game_id].to_i
          draws_str = matches[:draws]
          # draws_str = matches.fetch(:draws)

          if draws_str.nil?
            raise ArgumentError.new "No matches found for draws in: #{line}"
          end

          game = parse_draws_string(draws_str)

          game.possible?(@max_draw) ? game_id : 0
        end

        def parse_draws_string(draws_str)

          draws = draws_str.split(";").map { |draw_str| parse_draw_str(draw_str) }

          Game.new draws
        end

        def parse_draw_str(draw_str)
          red = parse_draw_match draw_str.match(/(\d+ red)/)
          green = parse_draw_match draw_str.match(/(\d+ green)/)
          blue = parse_draw_match draw_str.match(/(\d+ blue)/)

          Draw.new(red: red, green: green, blue: blue)
        end

        def parse_draw_match(match)
          (match || [0])[0].to_i
        end

        private

        DEFAULT = new(Draw.from_a [12,13,14]).freeze

      end

    end
  end
end
