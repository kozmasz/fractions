# frozen_string_literal: true

require_relative '../../app/models/equation_set'

RSpec.describe EquationSet do
  describe 'initialization' do
    it 'creates an EquationSet instance with valid elements' do
      equation_set = EquationSet.new('1/2 + 3&1/4')
      expect(equation_set).to be_a(EquationSet)
    end
  end

  describe 'validation' do
    let(:equation_set) { EquationSet.new('1/2 + 3&1/4') }

    it 'is valid with valid elements' do
      expect(equation_set).to be_valid
    end

    it 'is invalid with invalid elements' do
      equation_set[0] = 'abc'
      expect(equation_set).not_to be_valid
    end
  end

  describe '#solve' do
    let(:valid_input) { '1 + -3&1/3 * -2 - 5/3 / -3/7 + 7&1/2' }
    let(:equation_set) { EquationSet.new(valid_input) }

    it 'solves the equation' do
      result = equation_set.solve
      expect(result.value).to eq(Fraction.new('19&1/18').value)
    end
  end
end
