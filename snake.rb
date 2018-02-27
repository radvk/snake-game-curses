require 'timeout'

class Snake
  attr_reader :x, :y, :tail, :lenght

  def initialize(x = 1, y = 2)
    @x = x
    @y = y
    @tail = []
    @lenght = 3
    @dir = :right
  end

  def handle_movement
    key_pressed = nil
    begin
      Timeout::timeout(0.05) { key_pressed = getch }
    rescue Timeout::Error
    end
    handle_tail
    turn_head(key_pressed)
    snake_movement
  end

  private

  def turn_head(key_pressed)
    if key_pressed == 'w'
      @dir = :up if @dir != :down
    elsif key_pressed == 's'
      @dir = :down if @dir != :up
    elsif key_pressed == 'a'
      @dir = :left if @dir != :right
    elsif key_pressed == 'd'
      @dir = :right if @dir != :left
    end
  end

  def snake_movement
    case @dir
    when :up then @y -= 1
    when :down  then @y += 1
    when :left  then @x -= 1
    when :right then @x += 1
    end
  end

  def handle_tail
    tail.unshift([y, x])
    @tail = tail.first(lenght)
  end
end