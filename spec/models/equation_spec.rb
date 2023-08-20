# frozen_string_literal: true

require_relative '../../app/models/equation'

RSpec.describe Equation do
  let(:equation) { Equation.new('1/2 + 3&1/4') }

  describe 'initialization' do
    it 'creates an Equation instance with valid input' do
      expect(equation).to be_a(Equation)
    end
  end

  describe 'validation' do
    context 'when the elements are correct' do
      it 'is valid' do
        expect(equation.valid?).to be(true)
      end
    end

    context 'when the elements are NOT correct' do
      let(:equation) { Equation.new('1/2 +3&1/4') }

      it 'is invalid' do
        expect(equation.valid?).to be(false)
      end
    end
  end
end
