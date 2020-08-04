class RemainingTalks
  def initialize
    @remaining_talks = []
  end

  def fetch_talks
    @remaining_talks
  end

  def add_talk(talk)
    @remaining_talks << talk
  end
end
