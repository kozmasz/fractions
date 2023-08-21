# frozen_string_literal: true

require_relative '../app/models/fraction'

# This class is the extension of Rational Ruby class.
class Rational
  def self.from(object)
    whole, fractional = object.to_s.split('&')
    fractional = whole.to_i.negative? ? -fractional.to_r : fractional.to_r
    whole.to_r + fractional
  end

  def to_fraction
    Fraction.new(self)
  end
end
