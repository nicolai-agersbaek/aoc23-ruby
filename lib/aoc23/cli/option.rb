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
        str = self.as_s(str)

        matches = str.match PATTERN
        
        if matches == nil then
          raise ArgumentError.new "Unable to parse option string: '#{str}' (using pattern: #{PATTERN})"
        end

        #Debug::Dumper.dump(matches)
        self.new(name: matches[:name], short_name: matches[:short_name], value: matches[:value])
        #self.new(*matches[:name, :short_name, :value])
        #self.new(*matches)
      end

      def self.is_option(str)
        if str == nil
          false
        end

        begin
          self.from_s(str)
        rescue ArgumentError
          false
        ensure
          true
        end
      end

      def self.name_from_s(str)
        str = self.as_s(str)

        matches = str.match NAME_PATTERN
        
        if matches == nil then
          raise ArgumentError.new "Unable to parse option name string: '#{str}' (using pattern: #{NAME_PATTERN})"
        end

        matches[:name]
      end

      def self.is_name(str)
        if str == nil
          false
        end

        begin
          self.name_from_s(str)
        rescue ArgumentError
          false
        ensure
          true
        end
      end

      def self.short_name_from_s(str)
        str = self.as_s(str)

        matches = str.match NAME_PATTERN
        
        if matches == nil then
          raise ArgumentError.new "Unable to parse option name string: '#{str}' (using pattern: #{NAME_PATTERN})"
        end

        matches[:name]
      end

      def self.is_short_name(str)
        if str == nil
          false
        end

        begin
          self.short_name_from_s(str)
        rescue ArgumentError
          false
        ensure
          true
        end
      end

      def self.is_any_name(str)
        if str == nil
          false
        end

        begin
          self.short_name_from_s(str)
        rescue ArgumentError
          false
        ensure
          true
        end
      end

      private

      def self.as_s(str)
        if ! str.respond_to?(:to_s) then
          raise ArgumentError.new "Expected string; got: #{str.class}"
        end
        
        str.to_s
      end
      
      NAME_PATTERN = /^-?-(?<name>[a-z0-9]+)$/
      PATTERN = /^((--(?<name>[a-z0-9]+))|(-(?<short_name>[a-z0-9]+)))(((\s|=)(("(?<value>[^"]+)")|(?<value>.+)))?)$/
    end

  end
end
  