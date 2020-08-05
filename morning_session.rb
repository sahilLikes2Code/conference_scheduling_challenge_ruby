require_relative "session"

class MorningSession < Session
  def initialize
    super(180, 540)
  end
end
