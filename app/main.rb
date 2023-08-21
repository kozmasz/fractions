# frozen_string_literal: true

require 'readline'
require_relative 'models/equation_set'

command_history = []

loop do
  command = Readline.readline('? ', true)

  break if command.downcase.strip == 'exit'

  command_history << command
  equation_set = EquationSet.new(command)

  if equation_set.invalid?
    puts equation_set.errors.full_messages.join('. ')
  else
    puts "= #{equation_set.solve}"
  end
end
