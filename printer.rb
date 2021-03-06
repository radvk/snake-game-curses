require_relative 'playground'
require_relative 'top_bar'
require 'curses'
include Curses

class Printer
  attr_reader :playground, :top_bar
  def initialize
    @playground = Playground.new
    @top_bar = TopBar.new
    init_screen
    noecho
    curs_set(0)
  end

  def draw
    crmode
    loop do
      playground.play
    end
  ensure
    close_screen
  end
end
