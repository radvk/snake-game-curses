class Snake
  attr_reader :x, :y, :tail, :lenght

  def initialize(x = 1, y = 2) 
    @x = x
    @y = y
    @tail = []
    @lenght = 3
  end

  def handle_movement
    key_pressed = getch
    handle_tail
    if key_pressed == 'w'
      @y -= 1
    elsif key_pressed == 's'
      @y += 1
    elsif key_pressed == 'a'
      @x -= 1
    elsif key_pressed == 'd'
      @x += 1
    end
  end

  private

  def handle_tail
    tail.unshift([y, x])
    @tail = tail.first(lenght)
  end
end