# frozen_string_literal: true

module Aoc23
  module Cli
    class ArgDef
      attr_reader :name, :description, :cls

      def initialize(name:, description:"", cls:)
        @name = name
        @description = description
        @cls = cls
      end
    end
  end
end
  