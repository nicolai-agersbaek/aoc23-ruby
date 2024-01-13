# frozen_string_literal: true

require_relative "../debug/dumper"

module Aoc23
  module Cli

    class ArgDef
      attr_reader :name, :description, :cls

      def initialize(name:, description:nil, cls:)
        @name = name
        @description = description
        @cls = cls
      end
    end

    class ArgDefs
      attr_reader :items

      def initialize(*arg_defs)
        @items = arg_defs
        @items_by_name = @items.sort_by!{ |arg_def| arg_def.name }.to_h{ |arg_def| [arg_def.name, arg_def] }
      end

      def self.from_a(arg_defs)
        self.new(*arg_defs)
      end

      def get(index)
        @items.fetch(index) {|v| raise IndexError.new "No argument definition found for index: #{index}"}
      end

      def fetch(name)
        @items_by_name.fetch(name)
      end
    end

  end
end
  