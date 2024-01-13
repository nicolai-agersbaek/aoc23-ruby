# frozen_string_literal: true

require "test_helper"
require "aoc23/cli/option"

class TestAoc23 < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Aoc23::VERSION
  end

  def test_option_parses_str
    assert_option_parses_strs(
      ["--foo=some_value", "foo", nil, "some_value"],
      ["-foo=some_value", nil, "foo", "some_value"],
      ["--foo", "foo", nil, nil],
      ["-foo", nil, "foo", nil],
      ["--foo=\"some value\"", "foo", nil, "some value"],
      ["-foo=\"some value\"", nil, "foo", "some value"],
      ["--foo some_value", "foo", nil, "some_value"],
      ["-foo some_value", nil, "foo", "some_value"],
      ["--foo \"some value\"", "foo", nil, "some value"],
      ["-foo \"some value\"", nil, "foo", "some value"],
    )
  end

  private

  def assert_option_parses_strs(*cases)
    cases.each { |c| assert_option_parses_str(*c) }
  end

  def assert_option_parses_str(str, name, short_name, value)
    opt = ::Aoc23::Cli::Option.from_s(str)

    assert opt.name == name, "expected name to be '#{name}'; was: '#{opt.name}'"
    assert opt.short_name == short_name, "expected short_name to be '#{short_name}'; was: '#{opt.short_name}'"
    assert opt.value == value, "expected value to be '#{value}'; was: '#{opt.value}'"
  end
end
