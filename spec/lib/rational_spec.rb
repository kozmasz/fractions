# frozen_string_literal: true

require_relative '../../lib/rational'

RSpec.describe Rational do
  describe '.from' do
    context 'with a valid input' do
      it 'converts a whole number string to a rational' do
        result = Rational.from('123')
        expect(result).to eq(123.to_r)
      end

      it 'converts a positive fraction string to a rational' do
        result = Rational.from('1/4')
        expect(result).to eq(Rational(1, 4))
      end

      it 'converts a negative whole number string to a rational' do
        result = Rational.from('-456')
        expect(result).to eq(-456.to_r)
      end

      it 'converts a negative fraction string to a rational' do
        result = Rational.from('-3/5')
        expect(result).to eq(Rational(-3, 5))
      end

      it 'converts a mixed string (whole & fraction) to a rational' do
        result = Rational.from('2&3/8')
        expect(result).to eq(Rational(19, 8))
      end

      it 'converts a negative mixed string (whole & fraction) to a rational' do
        result = Rational.from('-2&3/8')
        expect(result).to eq(Rational(-19, 8))
      end
    end
  end

  describe '.to_fraction' do
    let(:rational) { '7/3'.to_r }
    let(:fraction) { rational.to_fraction }

    it 'converts a rational number to a Fraction' do
      expect(fraction).to be_instance_of(Fraction)
      expect(fraction.value).to eq(rational)
    end
  end
end
