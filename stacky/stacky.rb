# frozen_string_literal: true

require 'telegram/bot'

class Stacky
  TOKEN = '365071067:AAHAS0DmU2yr5zhnHk0-PMBGmQgBPT48JmU'

  def perform
    listen_messages do |bot, message|
    end
  end

  private

  def listen_messages
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        yield(bot, message)
      end
    end
  end
end
