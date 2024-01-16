# frozen_string_literal: true

module Aoc23
  class SolverLoader
    def load_solver(day:)
      require_relative File.join(File.dirname(__FILE__), "aoc23/tasks/day#{day}/solver")

      class_name = "Aoc23::Tasks::Day#{day}::Solver"
      solver = eval("#{class_name}")

      unless solver.respond_to?(:default)
        raise ArgumentError.new "Solver does not implement method 'default': #{solver.class}"
      end

      solver.default
    end
  end

end
