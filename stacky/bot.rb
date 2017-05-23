# frozen_string_literal: true

require 'telegram/bot'

class Bot
  TOKEN = '365071067:AAHAS0DmU2yr5zhnHk0-PMBGmQgBPT48JmU'
  CHAT_ID = '80527137'

  def send(link)
    perform { |bot| bot.api.send_message chat_id: CHAT_ID, text: link }
  end

  private

  def perform
    Telegram::Bot::Client.run(TOKEN) { |bot| yield(bot) }
  end
end
