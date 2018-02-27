require_relative 'snake'

class Playground
  def initialize
    @win = Window.new(lines, cols, 5, 0)
    @snake = Snake.new
  end

  def handle_movement
    @snake.handle_movement
  end

  def print
    @win.clear
    @win.box(?|,?-)
    print_snake
    # @win.setpos(@food_y,@food_x)
    # @win.addstr('*')
    @win.refresh
  end

  private

  def print_snake
    @win.setpos(@snake.y, @snake.x)
    @win.addstr('#')
    @snake.tail.each do |y, x|
      @win.setpos(y, x)
      @win.addstr('+')
    end
  end
end