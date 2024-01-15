# frozen_string_literal: true

require_relative "aoc23/version"
require_relative "aoc23/cli/args_parser"
require_relative "aoc23/cli/arg_def"
require_relative "aoc23/cli/option_def"

module Aoc23
  class Error < StandardError; end
  
  parser = Cli::ArgsParser.new(
    arg_defs: [
      Cli::ArgDef.new(name: "task_num", cls: 0.class),
      Cli::ArgDef.new(name: "input", cls: "".class),
    ],
    option_defs: [],
  )

  printf "Command-line args: %s\n", parser.parse

end
