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

  end
end
