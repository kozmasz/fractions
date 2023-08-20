# frozen_string_literal: true

# This class is the extension of Rational Ruby class.
class Rational
  def self.from(string)
    whole, fractional = string.split('&')
    fractional = whole.to_i.negative? ? -fractional.to_r : fractional.to_r
    whole.to_r + fractional
  end
end
