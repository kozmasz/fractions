require 'active_model'
require_relative '../../lib/rational'
require_relative '../validators/fraction_validator'

class Fraction
  include ActiveModel::Validations

  attr_accessor :expression, :value

  def initialize string
    @expression = string
    @value = Rational.from(string)
  end

  validates :expression, presence: true, fraction: true
end