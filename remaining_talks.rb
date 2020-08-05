class RemainingTalks
  attr_reader :talks

  def initialize
    @talks = []
  end

  def add_talk(talk)
    @talks << talk
  end

  def to_s
    result = "Remaining talks:\n"
    if @talks.length > 0
      talks.each do |t|
        result += "#{t}\n"
      end
    else
      result += "None"
    end
    "#{result}\n"
  end
end
