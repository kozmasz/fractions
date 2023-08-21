# frozen_string_literal: true

require_relative '../../app/models/fraction'

RSpec.describe Fraction do
  describe 'initialization' do
    it 'creates a Fraction instance with a valid expression' do
      fraction = Fraction.new('3/4')
      expect(fraction).to be_a(Fraction)
    end

    it 'calculates the correct value for the fraction' do
      fraction = Fraction.new('1/2'.to_r)
      expect(fraction.value).to eq(Rational(1, 2))
    end
  end

  describe 'validations' do
    let(:fraction) { Fraction.new('2&3/4') }

    it 'is valid with a valid expression' do
      expect(fraction).to be_valid
    end

    it 'is invalid without an expression' do
      fraction.expression = nil
      expect(fraction).not_to be_valid
    end

    it 'is invalid with an invalid expression' do
      fraction.expression = 'abc'
      expect(fraction).not_to be_valid
    end
  end

  describe '#to_s' do
    it 'converts to a whole number' do
      fraction = Fraction.new('2')
      expect(fraction.to_s).to eq('2')
      fraction = Fraction.new('-2')
      expect(fraction.to_s).to eq('-2')
    end

    it 'converts to a fraction' do
      fraction = Fraction.new('3/4')
      expect(fraction.to_s).to eq('3/4')
      fraction = Fraction.new('-3/4')
      expect(fraction.to_s).to eq('-3/4')
    end

    it 'converts to a mixed fraction' do
      fraction = Fraction.new('5&1/3')
      expect(fraction.to_s).to eq('5&1/3')
      fraction = Fraction.new('-5&1/3')
      expect(fraction.to_s).to eq('-5&1/3')
    end
  end
end
