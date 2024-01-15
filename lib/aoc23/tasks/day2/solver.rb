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
          # Game 1: 1 red, 2 green, 3 blue; 4 red, 5 green, 6 blue
          matches = line.match(/^Game (?<game_id>\d+): (?<draws>(?<draw>(\d+ red, \d+ green, \d+ blue))(; )?)/)
          #game_id = line.match(/^Game (?<id>\d+):/)[:id]

          game_id = matches[:game_id]
          draws = matches[:draws]
          draw = matches[:draw]

          puts "#{line}:\n"
          puts "game_id: #{game_id}\n"
          puts "draws: #{draws}\n"
          #puts "draw: #{draw}\n"

          #puts "#{game_id} < #{line}"

          0
          #game_id.to_i
        end

      end

    end
  end
end
