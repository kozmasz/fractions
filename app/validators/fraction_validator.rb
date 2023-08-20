class FractionValidator < ActiveModel::EachValidator
  REGEX = /\A-?(?:[0-9]+&[0-9]+\/[0-9]+|[0-9]+\/[0-9]+|[0-9]+)\z/

  def validate_each(record, attribute, value)
    unless REGEX.match?(value)
      record.errors.add(attribute, "#{value} must be a valid Fraction.(e.g.: 1, 1/3, 1&1/2)")
    end
  end
end