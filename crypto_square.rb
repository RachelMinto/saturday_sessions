
class Crypto
  include Math
  attr_accessor :message, :size

  def initialize(message)
    @message = message
    @message = normalize_plaintext
  end

  def normalize_plaintext
    if message.match(/[^a-zA-Z0-9]/i)
      self.message.gsub!(/[^a-zA-Z0-9]/i, '').downcase!
    end
    message
  end

  def size
    Math.sqrt(message.size).ceil
  end

  def plaintext_segments
    chunk = "#{size}"
    segments = message.scan(/.{1,chunk/)
    p segments
  end
end

crypto = Crypto.new('s#PL23**9unk')

crypto.normalize_plaintext

p crypto.size
crypto.plaintext_segments