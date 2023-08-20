# frozen_string_literal: true

require_relative 'equation_set'

# TODO: remove this class, use only EquationSet
# Equation.
class Equation
  attr_reader :input, :elements

  def initialize(input)
    @input = input
    @elements = EquationSet.new(*input.split(/\s+/))
  end

  def valid?
    elements.valid?
  end
end
