# frozen_string_literal: true

module Aoc23
  module Tasks

    class DataLoader

      attr_reader :data_dir

      def initialize(data_dir:"data")
        @data_dir = data_dir
      end

      def load_data(day:, part:1)
        file_name = "#{@data_dir}/day#{day}_#{part}.txt"

        if File.exist?(file_name)
          File.readlines(file_name)
        else
          raise ArgumentError.new "File not found: #{file_name}"
        end
      end

    end

  end
end
