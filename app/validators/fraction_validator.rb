# frozen_string_literal: true

# It validates a Fraction.
class FractionValidator < ActiveModel::EachValidator
  REGEX = %r{\A-?(?:[0-9]+&[0-9]+/[0-9]+|[0-9]+/[0-9]+|[0-9]+)\z}

  def validate_each(record, attribute, value)
    return if REGEX.match?(value)

    record.errors.add(attribute, "#{value} must be a valid Fraction.(e.g.: 1, 1/3, 1&1/2)")
  end
end
