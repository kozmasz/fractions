require_relative '../../app/models/fraction'
require_relative '../../lib/operator'

class EquationSetValidator < ActiveModel::Validator
  def validate(record)
    unless record.size > 2 && record.size.odd?
      record.errors.add(:equation, "must contain at least 3 elements.(fractional op fractional op fractional)")
    end

    record.each.with_index(1) do |element, index|
      if index.odd?
        record.errors.add(:equation, "#{element} must be a valid Fraction") unless element.is_a?(Fraction)
        next
        record.errors.add(:equation, element.errors.full_messages.join(". ")) unless element.valid?
      else
        record.errors.add(:equation, "#{element} must be a valid operator") unless element.is_a?(Operator)
      end
    end
  end
end