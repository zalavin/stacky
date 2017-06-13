# frozen_string_literal: true

require_relative '../stacky/stackoverflow'
require 'pry'

RSpec.describe StackOverflow do
  subject { StackOverflow.new }

  it 'is called' do
    binding.pry
    subject.perform
  end
end
