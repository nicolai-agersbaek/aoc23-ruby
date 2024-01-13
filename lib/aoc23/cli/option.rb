# frozen_string_literal: true

require_relative "../debug/dumper"

module Aoc23
  module Cli

    class Option
      attr_reader :name, :short_name, :value

      def initialize(name:, short_name:, value:)
        Option.validate_init_args(name, short_name)
        #self.validate_init_args(name, short_name)

        @name = name
        @short_name = short_name
        @value = value
      end

      def self.validate_init_args(name, short_name)
        name_given = (name != "" && name != nil)
        short_name_given = (short_name != "" && short_name != nil)
        
        if name_given && short_name_given then
          raise ArgumentError.new "Exactly one of name or short_name must be provided"
        end

        if !name_given && !short_name_given then
          raise ArgumentError.new "Exactly one of name or short_name must be provided"
        end
      end

      def self.from_s(str)
        matches = str.match PATTERN
        
        if matches == nil then
          raise ArgumentError.new "Unable to parse option string: '#{str}' (using pattern: #{PATTERN})"
        end

        #Debug::Dumper.dump(matches)
        self.new(name: matches[:name], short_name: matches[:short_name], value: matches[:value])
        #self.new(*matches[:name, :short_name, :value])
        #self.new(*matches)
      end

      private
      
      PATTERN = /^((--(?<name>[a-z0-9]+))|(-(?<short_name>[a-z0-9]+)))(((\s|=)(("(?<value>[^"]+)")|(?<value>.+)))?)$/
    end

  end
end
  