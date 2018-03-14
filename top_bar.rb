require_relative 'date_parser'

class TopBar
  attr_accessor :score

  def initialize
    @top_bar = Window.new(5, cols, 0, 0)
    @score = 0
    @time = Time.now
  end

  def display_bar
    @top_bar.box('|', '-')
    @top_bar.setpos(1, 1)
    @top_bar.addstr('SCORE: ' + @score.to_s)
    @top_bar.setpos(1, 15)
    @top_bar.addstr("TIME: #{time_passed}")
    @top_bar.setpos(1, 30)
    @top_bar.addstr('SPEED: ')
    @top_bar.refresh
  end

  #private

  def time_passed
    snake_time = Time.now - @time
    DateParser.new(snake_time).call
  end
end