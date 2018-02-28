require_relative 'snake'
require_relative 'food'
require_relative 'top_bar'

class Playground
  def initialize
    @win = Window.new(lines, cols, 5, 0)
    @snake = Snake.new
    @top_bar = TopBar.new
    @food = nil
  end

  def play
    handle_collisions
    handle_movement
    generate_food
    eat_food
    print_playground
  end

  private

  attr_reader :top_bar

  def eat_food
    return unless @snake.x == @food.food_x && @snake.y == @food.food_y
    @food = nil
    @snake.length += 1
    @top_bar.score += 1
  end

  def print_food
    return if @food.nil?
    @win.setpos(@food.food_y, @food.food_x)
    @win.addstr(@food.food)
  end

  def generate_food
    return unless @food.nil?
    food_y = rand(2..@win.maxy - 2)
    food_x = rand(1..@win.maxx - 2)
    #sprawdzicz czy zarcie nachodzi na weza czyli czy glowa albo ogon ma te same wpolrzedne co zarcie
    @food = Food.new(food_y, food_x)
  end

  def handle_movement
    @snake.handle_movement
  end

  def print_playground
    @win.clear
    @win.box('|', '-')
    top_bar.display_bar
    print_snake
    print_food
    @win.refresh
    @win.clear
  end

  def print_snake
    @win.setpos(@snake.y, @snake.x)
    @win.addstr('#')
    @snake.tail.each do |y, x|
      @win.setpos(y, x)
      @win.addstr('+')
    end
  end

  def handle_collisions
    game_over if border_collision? || @snake.tail_collision?
  end

  def border_collision?
    @snake.x >= @win.maxx - 1 || @snake.y >= @win.maxy - 1 ||
      @snake.x.zero? || @snake.y.zero?
  end

  def game_over
    1 / 0
  end
end