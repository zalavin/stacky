# frozen_string_literal: true

require 'net/http'
require 'json'
require 'openssl'
require 'pry'

class Api
  URL = 'https://api.stackexchange.com'

  def perform
    JSON.parse(request.body, symbolize_names: true)[:items].map { |record| record[:link] }
  end

  private

  def http
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end

  def request
    http.get path
  end

  def uri
    URI.parse URL
  end

  def path
    "/2.2/questions?#{to_query params}"
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
    params.map { |k,v| "#{k}=#{v}" }.join('&')
  end
end

p Api.new.perform
