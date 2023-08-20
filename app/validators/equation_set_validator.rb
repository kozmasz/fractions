# frozen_string_literal: true

require_relative '../../app/models/fraction'
require_relative '../../lib/operator'

# It validates an EquationSet.
class EquationSetValidator < ActiveModel::Validator
  # rubocop:disable Metrics/MethodLength
  def validate(record)
    validate_record_size(record)
    record.each.with_index(1) do |element, index|
      if index.odd?
        unless element.is_a?(Fraction)
          record.errors.add(:equation, "#{element} must be a valid Fraction")
          next
        end
        validate_fraction(element)
      else
        validate_operator(element)
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def validate_record_size(record)
    return if record.size > 2 && record.size.odd?

    record.errors.add(:equation, 'must contain at least 3 elements.(fractional op fractional op fractional)')
  end

  def validate_fraction(element)
    record.errors.add(:equation, element.errors.full_messages.join('. ')) unless element.valid?
  end

  def validate_operator(element)
    record.errors.add(:equation, "#{element} must be a valid operator") unless element.is_a?(Operator)
  end
end
