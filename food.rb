class Food
  attr_reader :food, :food_x, :food_y
  def initialize(food_y, food_x)
    @food_x = food_x
    @food_y = food_y
    @food = '*'
  end
end