# frozen_string_literal: true

module Aoc23
  class SolverLoader
    def load_solver(day:, part:1)
      require_relative File.join(File.dirname(__FILE__), "aoc23/tasks/day#{day}/part#{part}/solver")

      class_name = "Aoc23::Tasks::Day#{day}::Part#{part}::Solver"
      solver_cls = eval("#{class_name}")

      unless solver_cls.respond_to?(:default)
        raise ArgumentError.new "Solver does not implement method 'default': #{solver_cls.class}"
      end

      solver = solver_cls.default

      unless solver.respond_to?(:solve)
        raise ArgumentError.new "Solver does not implement method 'solve': #{solver.class}"
      end

      solver
    end
  end

end
