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
    raise "Invalid starting cup" unless start_pos.between?(0, 5) || start_pos.between?(7, 12)
    raise "Starting cup is empty" if cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos].count
    cups[start_pos] = []
    current_cup = start_pos + 1
    end_cup = 0
    player_1 == current_player_name ? opponents_cup = 13 : opponents_cup = 6
    stones.times do |i|
      next_cup = (current_cup + i) % 14
      if next_cup == opponents_cup
        current_cup += 1
        next_cup = (current_cup + i) % 14
      end
      cups[next_cup] << :stone
      end_cup = next_cup
    end
    self.render
    self.next_turn(end_cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].length == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?{|cup| cup.empty?} || cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    result = cups[6].count <=> cups[13].count
    return player_1 if result == 1
    return player_2 if result == -1
    return :draw
  end
end
