# frozen_string_literal: true

require_relative "../solver"

module Aoc23
  module Tasks
    module Day2

      class Solver < Tasks::Solver

        attr_reader :max_draw

        def initialize(max_draw)
          @max_draw = max_draw
        end

        def solve(input:)
          input.map { |line| solve_line(line) }
               .sum
        end

        def solve_line(line)
          matches = line.match(/^Game (?<game_id>\d+): (?<draws>.+)/)

          game_id = matches[:game_id].to_i
          game = parse_draws_string(matches[:draws])

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
          !match.nil? ? match[0].to_i : 0
        end

      end

    end
  end
end
