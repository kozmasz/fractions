require 'active_model'
require_relative '../../app/validators/fraction_validator'

RSpec.describe FractionValidator do
  class FractionModel
    include ActiveModel::Validations
    attr_accessor :fraction
    validates :fraction, fraction: true
  end

  let(:model) { FractionModel.new }

  context 'with valid fractions' do
    it 'allows a whole number' do
      model.fraction = '5'
      expect(model).to be_valid
    end

    it 'allows a positive fraction' do
      model.fraction = '3/4'
      expect(model).to be_valid
    end

    it 'allows a mixed number' do
      model.fraction = '2&1/3'
      expect(model).to be_valid
    end

    it 'allows a negative whole number' do
      model.fraction = '-8'
      expect(model).to be_valid
    end

    it 'allows a negative fraction' do
      model.fraction = '-1/5'
      expect(model).to be_valid
    end

    it 'allows a negative mixed number' do
      model.fraction = '-3&2/7'
      expect(model).to be_valid
    end
  end

  context 'with invalid fractions' do
    it 'disallows invalid format' do
      model.fraction = 'abc'
      expect(model).not_to be_valid
    end

    it 'disallows non-fraction text' do
      model.fraction = 'hello'
      expect(model).not_to be_valid
    end
  end
end
