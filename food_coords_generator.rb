class FoodCoordsGenerator
  def initialize(snake, win)
    @snake = snake
    @win = win
  end

  def call
    coords_of_food
  end

  private

  attr_reader :snake, :win
  attr_accessor :food_x, :food_y

  def head_collision?
    snake.x == food_x && snake.y == food_y
  end

  def tail_collision?
    snake.tail.any? do |tail_y, tail_x|
      food_y == tail_y && food_x == tail_x
    end
  end

  def coords_of_food
    food_y = rand(2..win.maxy - 2)
    food_x = rand(1..win.maxx - 2)
    while head_collision? || tail_collision?
      food_y = rand(2..win.maxy - 2)
      food_x = rand(1..win.maxx - 2)
    end
    { x: food_x, y: food_y }
  end
end