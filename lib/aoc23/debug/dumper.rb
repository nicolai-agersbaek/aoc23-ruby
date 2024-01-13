# frozen_string_literal: true

module Aoc23
  module Debug

    class Dumper
      def self.dump(val, name="val")
        printf "%s = %s, %s.class = %s\n", name, val, name, val.class
      end
    end

  end
end
  