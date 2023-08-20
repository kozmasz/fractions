require_relative '../../app/models/fraction'

RSpec.describe Fraction do
  describe 'initialization' do
    it 'creates a Fraction instance with a valid expression' do
      fraction = Fraction.new('3/4')
      expect(fraction).to be_a(Fraction)
    end

    it 'calculates the correct value for the fraction' do
      fraction = Fraction.new('1/2')
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
end
