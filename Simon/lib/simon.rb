class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(1)
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
      sleep(1)
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    puts 'Here is the sequence'
    sleep(1)
    system("clear")
    seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(1)
    end
    nil
  end

  def require_sequence
    color_hash = { "r" => "red", "b" => "blue", "g" => "green","y" => "yellow"}
    puts "Enter one color at a time and then hit Enter"
    puts "r = red, b = blue, g = green, and y = yellow"
    guesses = 0
    copy_sequence = seq.dup
    until game_over || guesses == sequence_length
      guess = gets.chomp
      @game_over = true if color_hash[guess] != copy_sequence.first
      guesses += 1
      copy_sequence.rotate!
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You have successfully completed that round!"
  end

  def game_over_message
    puts "You made a mistake, Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    copy = seq.dup
    @seq = []
    puts copy.join(", ")
    nil
  end
end
