# frozen_string_literal: true

require_relative "aoc23/version"

require_relative "aoc23/cli/args_parser"
require_relative "aoc23/cli/arg_def"

require_relative "aoc23/tasks/data_loader"

require_relative "solver_loader"

module Aoc23
  class Error < StandardError; end

  parser = Cli::ArgsParser.new(
    arg_defs: [
      Cli::ArgDef.new(name: "day", cls: Integer),
      # Cli::ArgDef.new(name: "part", cls: Integer, default_value: 1),
    ],
    option_defs: [],
  )

  day = parser.parse.fetch("day")

  input = Tasks::DataLoader.new.load_data(day: day)

  solution = SolverLoader.new.load_solver(day: day).solve(input)

  printf "Solution: %s\n", solution

end
