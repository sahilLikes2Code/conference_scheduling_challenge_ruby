require_relative "session"

class Track
  attr_reader :morning_session, :evening_session

  def initialize()
    @sessions = []
    @result = ""
  end

  def add_session(session)
    @sessions << session
  end

  def to_s
    @sessions.each do |session|
      @result += "#{session}\n"
    end
    "#{@result}\n"
  end
end
