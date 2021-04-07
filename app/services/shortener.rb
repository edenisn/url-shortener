require 'digest/sha2'

class Shortener
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def call
    Digest::SHA256.hexdigest(url)[0..10] rescue nil
  end
end
