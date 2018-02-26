class TopBar
  def initialize
    @top_bar = Window.new(5,cols,0,0)
  end

  def top_bar
    @top_bar.box(?|,?-)
    @top_bar.setpos(1,1)
    @top_bar.addstr('SCORE: ')
    @top_bar.setpos(1,10)
    @top_bar.addstr('TIME: ')
    @top_bar.setpos(1,20)
    @top_bar.addstr('SPEED: ')
    @top_bar.refresh
  end
end