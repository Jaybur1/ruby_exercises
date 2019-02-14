class Timer
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end
  def seconds=(sec)
    @seconds = sec
  end
#handle number to timer transletor
  def translate(num)
    num < 10 ? "0#{num}" : "#{num}"
  end
#handle timer
  def time_string
    sec = @seconds % 60
    min = @seconds / 60 % 60
    hour = @seconds / 60 / 60
    "#{translate(hour)}:#{translate(min)}:#{translate(sec)}"
  end
end

