class TopBar
  attr_accessor :score

  def initialize
    @top_bar = Window.new(5, cols, 0, 0)
    @score = 0
  end

  def display_bar
    @top_bar.box('|', '-')
    @top_bar.setpos(1, 1)
    @top_bar.addstr('SCORE: ' + @score.to_s)
    @top_bar.refresh
    @top_bar.setpos(1, 15)
    @top_bar.addstr('TIME: ')
    @top_bar.setpos(1, 30)
    @top_bar.addstr('SPEED: ')
    @top_bar.refresh
  end
end
