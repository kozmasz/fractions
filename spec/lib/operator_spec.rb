# frozen_string_literal: true

require_relative '../../lib/operator' # Adjust the path to the 'rational' file accordingly

RSpec.describe Operator do
  let(:operator) { Operator.new(1, 'ADD', :+) }

  describe 'structure' do
    it 'has a precedence field' do
      expect(operator.precedence).to eq(1)
    end

    it 'has a name field' do
      expect(operator.name).to eq('ADD')
    end

    it 'has a ruby_operator field' do
      expect(operator.ruby_operator).to eq(:+)
    end
  end

  describe 'initialization' do
    it 'creates an Operator instance' do
      expect(operator).to be_a(Operator)
    end
  end

  describe 'fields are readable' do
    it 'allows reading the precedence field' do
      expect(operator.precedence).to eq(1)
    end

    it 'allows reading the name field' do
      expect(operator.name).to eq('ADD')
    end

    it 'allows reading the ruby_operator field' do
      expect(operator.ruby_operator).to eq(:+)
    end
  end
end
