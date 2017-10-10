require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each.with_index do |cup, i|
      next if i == 6 or i == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 1 || start_pos > 13
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    next_pos = start_pos
    until stones.empty?
      next_pos += 1
      next_pos = next_pos % 14
      if current_player_name == @name1
        next if next_pos == 13
      elsif current_player_name == @name2
        next if next_pos == 6
      end
      @cups[next_pos] << stones.pop
    end
    render
    next_turn(next_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    if @cups[6] == @cups[13]
      return :draw
    elsif @cups[6].length > @cups[13].length
      return @name1
    else
      return @name2
    end
  end
end
