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

  def initialize(input = '')
    super()
    @input = input
    splitted_input = (input || '').split(/\s+/)
    splitted_input.each.with_index(1) do |element, index|
      push(index.odd? ? Fraction.new(element) : OPERATORS[element] || element)
    end
  end

  # rubocop:disable Metrics/MethodLength

  def solve
    operand_stack = []

    to_rpn.each do |element|
      if element.is_a?(Fraction)
        operand_stack.push(element)
      elsif element.is_a?(Operator)
        right_operand = operand_stack.pop
        left_operand = operand_stack.pop
        result = left_operand.value.send(element.ruby_operator, right_operand.value).to_fraction
        operand_stack.push(result)
      end
    end

    operand_stack.pop
  end

  private

  # Reverse Polish Notation
  def to_rpn
    output_queue = []
    operator_stack = []

    each do |element|
      if element.is_a?(Fraction)
        output_queue << element
      elsif element.is_a?(Operator)
        while operator_stack.any? && operator_stack.last.precedence >= element.precedence
          output_queue << operator_stack.pop
        end
        operator_stack << element
      end
    end

    output_queue + operator_stack.reverse
  end
  # rubocop:enable Metrics/MethodLength
end
