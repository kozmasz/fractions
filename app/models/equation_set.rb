require 'active_model'
require_relative '../validators/equation_set_validator'
require_relative '../../lib/operator'
require_relative 'fraction'

class EquationSet < Array
  include ActiveModel::Validations

  OPERATORS = {
    "+" => Operator.new(1, "ADD", :+),
    "-" => Operator.new(1, "SUB", :-),
    "*" => Operator.new(2, "MUL", :*),
    "/" => Operator.new(2, "DIV", :/)
  }.freeze

  validates_with EquationSetValidator

  def initialize(*args)
    super()
    args.each.with_index(1) do |element, index|
      push(index.odd? ? Fraction.new(element) : OPERATORS[element] || element)
    end
  end
end