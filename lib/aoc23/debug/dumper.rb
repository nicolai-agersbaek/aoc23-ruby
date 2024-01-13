# frozen_string_literal: true

module Aoc23
  module Debug

    class Dumper
      def self.dump(val, name="")
        if name != ""
          puts "#{name}: #{val.inspect}"
        else
          puts val.inspect
        end
      end
    end

  end
end
  