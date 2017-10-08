class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each { |color| p color }
  end

  def require_sequence
    input = nil
    until input
      p "Please enter the sequence of colors followed by commas."
      input = gets.chomp.split(",")
    end
    if input != @seq
      @game_over = true
    else
      @game_over = false
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "You got every color in the correct order!"
  end

  def game_over_message
    p "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
