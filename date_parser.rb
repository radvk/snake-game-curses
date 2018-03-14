class DateParser
  attr_accessor :x
  def initialize(x)
    @x = x.to_i
  end

  def call
    if x >= 3600
      hours + min + sec
    elsif x >= 60 && x < 3600
      min + sec
    elsif x < 60
      sec
    end
  end

  private

  def min
    minuty = x % 3600 / 60
    minuty.to_s.rjust(2, '0') + ' : '
  end

  def hours
    godziny = x / 3600
    godziny.to_s.rjust(2, '0') + ' : '
  end

  def sec
    sekundy = x % 60
    sekundy.to_s.rjust(2, '0')
  end
end