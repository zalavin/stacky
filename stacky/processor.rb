# frozen_string_literal: true

require 'redis'
require_relative 'api'
require_relative 'bot'
require_relative 'repository'

class Processor
  def perform
    loop do
      StackOverflow.new.perform.each do |link|
        break if repository.present? link
        Bot.new.send link
        repository.add link
      end
      sleep 300
    end
  end

  private

  def repository
    Repository.new
  end
end
