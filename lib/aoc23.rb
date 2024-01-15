# frozen_string_literal: true

require_relative "aoc23/version"
require_relative "aoc23/cli/args_parser"
require_relative "aoc23/cli/arg_def"
require_relative "aoc23/cli/option_def"
require_relative "aoc23/cli/option_def"

module Aoc23
  class Error < StandardError; end
  
  parser = Cli::ArgsParser.new(
    arg_defs: [
      Cli::ArgDef.new(name: "day", cls: Integer),
      # Cli::ArgDef.new(name: "input", cls: String),
    ],
    option_defs: [],
  )

  day = parser.parse.fetch("day")

  input = File.readlines("data/day#{day}.txt")

  require_relative "aoc23/solutions/day#{day}"

  solution = Solutions::Day1.new.solve(input: input)

  printf "Solution: %s\n", solution

end
