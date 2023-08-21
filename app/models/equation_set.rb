# frozen_string_literal: true

require 'active_model'
require_relative '../validators/equation_set_validator'
require_relative '../../lib/operator'
require_relative 'fraction'

# This class represents a mathematical equation.
class EquationSet < Array
  include ActiveModel::Validations

  OPERATORS = {
    '+' => Operator.new(1, 'ADD', :+),
    '-' => Operator.new(1, 'SUB', :-),
    '*' => Operator.new(2, 'MUL', :*),
    '/' => Operator.new(2, 'DIV', :/)
  }.freeze

  attr_reader :input

  validates_with EquationSetValidator

  def initialize(input = "")
    super()
    @input = input
    splitted_input = (input || "").split(/\s+/)
    splitted_input.each.with_index(1) do |element, index|
      push(index.odd? ? Fraction.new(element) : OPERATORS[element] || element)
    end
  end
end
