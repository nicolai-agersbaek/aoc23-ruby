# frozen_string_literal: true

require_relative "../debug/dumper"

module Aoc23
  module Cli

    class OptionDef
      attr_reader :name, :description, :cls

      def initialize(name:, description:nil, cls:)
        @name = name
        @description = description
        @cls = cls
      end
    end

    class OptionDefs
      def initialize(*option_defs)
        @option_defs = option_defs
        @option_defs_by_name = @option_defs.sort_by!{ |opt| opt.name }.to_h{ |opt| [opt.name, opt] }
      end

      def self.from_a(option_defs)
        self.new(*option_defs)
      end

      def fetch(name)
        @option_defs.fetch(name)
      end
    end

  end
end
  