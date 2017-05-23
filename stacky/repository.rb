# frozen_string_literal: true

class Repository
  SET_NAME = 'stacky:links'

  def add(item)
    redis.sadd set_name, item
  end

  def present?(item)
    redis.sismember set_name, item
  end

  private

  def redis
    Redis.current
  end

  def set_name
    SET_NAME
  end
end
