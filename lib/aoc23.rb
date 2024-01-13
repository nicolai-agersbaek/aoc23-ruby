# frozen_string_literal: true

require_relative "aoc23/version"
require_relative "aoc23/cli/parser"
require_relative "aoc23/cli/arg_def"

module Aoc23
  class Error < StandardError; end
  
  parser = Cli::ArgsParser.new(
    Cli::ArgDef.new(name: "task_num", cls: 0.class)
  )

  printf "Command-line args: %s\n", parser.parse

end
