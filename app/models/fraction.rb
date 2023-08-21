# frozen_string_literal: true

require 'active_model'
require_relative '../../lib/rational'
require_relative '../validators/fraction_validator'

# This class represents a mathematical fraction.
class Fraction
  include ActiveModel::Validations

  attr_accessor :expression, :value

  def initialize(object)
    @expression = object.to_s
    @value = Rational.from(@expression)
  end

  validates :expression, presence: true, fraction: true

  def to_s
    whole = value.to_i
    fraction = value - whole

    if fraction.zero?
      whole.to_s
    elsif whole.zero?
      "#{fraction.numerator}/#{fraction.denominator}"
    else
      "#{whole}&#{fraction.abs}"
    end
  end
end
