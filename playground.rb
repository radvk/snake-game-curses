require_relative 'snake'
require_relative 'food'
require_relative 'top_bar'
require_relative 'food_coords_generator'

class Playground
  def initialize
    @win = Window.new(lines, cols, 5, 0)
    @snake = Snake.new
    @top_bar = TopBar.new
    @food = nil
    @time = Time.now
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
    coords = FoodCoordsGenerator.new(@snake, @win).call
    @food = Food.new(coords[:y], coords[:x])
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
    go_win = Window.new(lines, cols, 0, 0)
    go_win.box('|', '-')
    go_win.setpos(lines / 2, cols / 2)
    go_win.addstr('GAME OVER')
    go_win.setpos(1, 1)
    go_win.addstr('Your score: ' + @top_bar.score.to_s)
    go_win.setpos(2, 1)
    go_win.addstr('Your time: ' + @top_bar.time_passed)
    exit if go_win.getch
  end
end