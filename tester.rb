# This is a basic Testing module
# Call these methods with Tester.<method_name>

module Tester

  # This test checks for equality and gives an error if
  # the arguments are not equal
  def self.expect_equal(actual, expected)
    if expected == actual
      true
    else
      "Expected #{actual} to be #{expected}"
    end
  end

  # This test checks if there was an exception raised
  # and gives an error if there was not
  #
  # For clarity: an exception is raised when something goes wrong
  # ArgumentError is an exception denoting the wrong number of arguments
  def self.expect_fail(&block)
    if block
      begin
        block.call
        "The method did not raise an error"
      rescue
        true
      end
    end
  end
end


# Tests
# The conditional below means: "if this file was called directly"
# eg. $ ruby tester.rb
#
# Requiring this file does not execute this code
# eg. require './tester'
#
if __FILE__ == $0
  puts "\nStarting tests for file: #{__FILE__}\n\n"
  puts "Method expect_equal: #{Tester.expect_equal(0,0)} should be true"
  puts "Method expect_equal: '#{Tester.expect_equal(0,1)}' should be a failure message"

  puts "Method expect_fail: #{Tester.expect_fail{ raise }} should be true"
  puts "Method expect_fail: '#{Tester.expect_fail{ "no message raised" }}' should be a failure message"
  puts "\n Tests for #{__FILE__} Completed \n\n"
end
