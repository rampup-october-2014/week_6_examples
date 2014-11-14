# This file demonstrates basic inheritance
# NOTE: the last definition wins.  If I redefine a method in a
# subclass, it will override previous definitions it inherited

# I have written a basic testing module in tester.rb
require './tester'

# Given a width and height, the rectangle class has
# methods to get width, height, and area
class Rectangle
  def initialize(given_width, given_height)
    @stored_width = given_width
    @stored_height = given_height
  end

  def width
    @stored_width
  end

  def height
    @stored_height
  end

  def area
    @stored_width * @stored_height
  end
end

# Tests for Rectangle
if File.identical?(__FILE__, $0)
  puts "\nStarting tests for file: #{__FILE__}\n\n"
  puts "Rectangle width: #{ Tester.expect_equal(Rectangle.new(5,6).width, 5)}"
  puts "Rectangle height: #{ Tester.expect_equal(Rectangle.new(7,8).height, 8)}"
  puts "Rectangle area: #{ Tester.expect_equal(Rectangle.new(9,10).area, 90)}"
end


# Square takes a single side length but
class Square < Rectangle
  def initialize(side_length)
    @stored_width = side_length
    @stored_height = side_length
  end
end

# Tests for Square
if File.identical?(__FILE__, $0)
  puts "Square width: #{ Tester.expect_equal(Square.new(5).width, 5)}"
  puts "Square height: #{ Tester.expect_equal(Square.new(7).height, 7)}"
  puts "Square area: #{ Tester.expect_equal(Square.new(9).area, 81)}"
end


class FancySquare < Rectangle
  def initialize(side_length)
    super(side_length, side_length)  # this calls Rectangle.initialize
  end
end

# Tests for FancySquare
if File.identical?(__FILE__, $0)
  puts "FancySquare width: #{ Tester.expect_equal(FancySquare.new(5).width, 5)}"
  puts "FancySquare height: #{ Tester.expect_equal(FancySquare.new(7).height, 7)}"
  puts "FancySquare area: #{ Tester.expect_equal(FancySquare.new(9).area, 81)}"
end


class FailSquare < Rectangle
  def initialize(side_length)
    @different_variable = side_length   # this fails to define the necessary variables
  end
end

if File.identical?(__FILE__, $0)
  puts "FailSquare has no width: #{ Tester.expect_equal(FailSquare.new(5).width, nil)}"
  puts "FailSquare has no height: #{ Tester.expect_equal(FailSquare.new(7).height, nil)}"
  puts "FailSquare cant get area: #{Tester.expect_fail{ FailSquare.new(9).area }}"
  puts "\n Tests for #{__FILE__} Completed \n\n"
end









