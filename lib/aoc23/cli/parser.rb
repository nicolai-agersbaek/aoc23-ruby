# frozen_string_literal: true

require_relative "../debug/dumper"

module Aoc23
  module Cli

    class ArgsParser
      attr_reader :arg_defs

      @@value_parsers = {
        "".class => lambda { |x| x.to_s },
        0.class => lambda { |x| x.to_i },
      }

      def initialize(*arg_defs)
        @arg_defs = arg_defs
      end

      def parse(args = $*)
        args.map.with_index { |arg,i| parse_arg(i,arg) }.to_h
      end

      private
      
      def parse_arg(index,arg)
        arg_def = @arg_defs[index]

        val = arg_val(arg, arg_def)

        [arg_def.name, val]
      end

      def arg_val(arg, arg_def)
        value_parser = @@value_parsers.fetch(arg_def.cls)

        value_parser.call(arg)
      end
    end

  end
end
  