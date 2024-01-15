# frozen_string_literal: true

require_relative "../debug/dumper"
require_relative "arg_def"
require_relative "option_def"
require_relative "option_defs"
require_relative "option"

module Aoc23
  module Cli

    class ArgsParser
      attr_reader :arg_defs, :option_defs

      #noinspection RubyClassVariableUsageInspection
      @@value_parsers = {
        "".class => lambda { |x| x.to_s },
        0.class => lambda { |x| x.to_i },
      }

      def initialize(arg_defs:, option_defs:)
        @arg_defs = Cli::ArgDefs.from_a(arg_defs)
        @num_arg_defs = @arg_defs.items.size
        @option_defs = Cli::OptionDefs.from_a(option_defs)
      end

      def parse(args = $*)
        num_args = args.size

        if @num_arg_defs > num_args
          raise ArgumentError.new "Invalid number of arguments provided; expected at most #{@num_arg_defs}, got: #{num_args}"
        end

        arg_defs_and_values = @arg_defs.items.map.with_index{ |arg_def,i| [arg_def, args[i]] }

        resulting_args = []

        arg_defs_and_values.each { |dv|
          arg_def, arg = dv

          if Cli::Option.is_name?(arg) || Cli::Option.is_option?(arg)
            raise ArgumentError.new "Expected argument #{arg_def.name}; got option string: #{arg}"
          elsif resulting_args.push(arg)
          end
        }

        puts resulting_args.inspect

        resulting_args
      end

      def parse2(args = $*)
        args.map.with_index { |arg,i| parse_arg(i,arg) }.to_h
      end

      private
      
      def parse_arg(index, arg)
        arg_def = @arg_defs.get(index)

        val = arg_val(arg, arg_def)

        [arg_def.name, val]
      end

      def arg_val(arg, arg_def)
        #noinspection RubyClassVariableUsageInspection
        value_parser = @@value_parsers.fetch(arg_def.cls)

        value_parser.call(arg)
      end
    end

  end
end
