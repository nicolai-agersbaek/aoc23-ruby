# frozen_string_literal: true

require_relative "../debug/dumper"

module Aoc23
  module Cli

    class ArgDef
      attr_reader :name, :description, :cls

      def initialize(name:, description:"", cls:)
        @name = name
        #@description = description when description != ""
        @description = description
        @cls = cls
      end
    end

    class ArgDefs
      attr_reader :arg_defs

      def initialize(*arg_defs)
        @arg_defs = arg_defs
        @arg_defs_by_name = @arg_defs.sort_by!{ |arg_def| arg_def.name }.to_h{ |arg_def| [arg_def.name, arg_def] }
      end

      def self.from_a(arg_defs)
        self.new(*arg_defs)
      end

      def get(index)
        @arg_defs[index]
      end

      def fetch(name)
        @arg_defs.fetch(name_or_short)
      end
    end

  end
end
  