# frozen_string_literal: true

require 'active_model'
require_relative '../../app/validators/equation_set_validator'

class EquationSetModel < Array
  include ActiveModel::Validations
  validates_with EquationSetValidator
end

RSpec.describe EquationSetValidator do
  let(:model) { EquationSetModel.new }

  context 'with valid equation sets' do
    it 'allows a valid equation set with fractions and operators' do
      equation = EquationSetModel.new [Fraction.new('1/2'), Operator.new(1, 'ADD', :+), Fraction.new('3/4')]
      expect(equation).to be_valid
    end

    it 'allows a valid equation set with negative numbers' do
      equation = EquationSetModel.new [Fraction.new('-5/7'), Operator.new(2, 'MUL', :*), Fraction.new('1/3')]
      expect(equation).to be_valid
    end
  end

  context 'with invalid equation sets' do
    it 'disallows an equation set with too few elements' do
      equation = EquationSetModel.new []
      expect(equation).not_to be_valid
    end

    it 'disallows an equation set with even number of elements' do
      equation = EquationSetModel.new [Fraction.new('1/2'), Operator.new(1, 'ADD', :+)]
      expect(equation).not_to be_valid
    end

    it 'disallows an equation set with invalid fraction' do
      equation = EquationSetModel.new [Fraction.new('1/2'), Operator.new(1, 'ADD', :+), 'invalid']
      expect(equation).not_to be_valid
    end

    it 'disallows an equation set with invalid operator' do
      equation = EquationSetModel.new [Fraction.new('1/2'), Operator.new(1, 'ADD', :+), Fraction.new('3/4'), 'invalid']
      expect(equation).not_to be_valid
    end
  end
end
