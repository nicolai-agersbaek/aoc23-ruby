# frozen_string_literal: true

module Aoc23
  module Cli

    # class OptionDefs <- Enumerable
    class OptionDefs
      def initialize(*option_defs)
        @option_defs = option_defs
        @option_defs_by_name = @option_defs.sort_by!{ |opt| opt.name }.to_h{ |opt| [opt.name, opt] }
      end

      def self.from_a(option_defs)
        self.new(*option_defs)
      end

      def fetch(name)
        @option_defs_by_name.fetch(name)
      end
    end

  end
end
