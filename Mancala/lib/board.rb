class Board
  attr_accessor :cups, :player_1, :player_2

  def initialize(name1, name2)
    @cups = place_stones
    @player_1 = name1
    @player_2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    new_cups = Array.new(14){Array.new(0)}
    new_cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        4.times do 
          cup << :stone
        end
      end
    end
    new_cups
  end

  def valid_move?(start_pos)
  end

  def make_move(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
