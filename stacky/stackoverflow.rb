# frozen_string_literal: true

require 'httparty'

class StackOverflow
  URL = 'https://api.stackexchange.com'

  def perform
    JSON.parse(response.body, symbolize_names: true)[:items].map { |record| record[:link] }
  end

  private

  def response
    HTTParty.get url
  end

  def url
    "http://api.stackexchange.com/2.2/questions?#{to_query params}"
  end

  def params
    {
      order: 'desc',
      sort: 'activity',
      tagged: 'ruby',
      site: 'stackoverflow'
    }
  end

  def to_query(params)
    params.map { |k, v| "#{k}=#{v}" }.join('&')
  end
end
