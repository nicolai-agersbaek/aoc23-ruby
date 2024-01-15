# frozen_string_literal: true

require_relative "../debug/dumper"

module Aoc23
  module Solutions
    class Day1

      def solve(input:)
        input.map { |line| solve_line(line) }
             .sum
      end

      def solve_line(line)
        first = nil
        last = nil

        line.split("")
            .map { |c| c.to_i }
            .filter(&:positive?)
            .each { |i| first = i if first.nil?; last = i }

        if first.nil? || last.nil?
          raise ArgumentError.new "Invalid input: #{line}"
        end

        10*first + last
      end

    end

  end
end
