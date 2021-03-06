class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
     a = Array.new(14){[]}
     i = 0
     while i < 14
       if i == 6 || i == 13
         i += 1
         next
        end
       a[i] += [:stone, :stone, :stone, :stone]
       i += 1
      end
      a
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 12 || start_pos < 0
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    count = @cups[start_pos].length
    @cups[start_pos] = []

    until count == 0
      start_pos +=  1
      start_pos = 0 if start_pos > 13

      if start_pos == 6 && @name1 == current_player_name
        @cups[6] << :stone
      elsif start_pos == 13 && @name2 == current_player_name
        @cups[13] << :stone
      else
        @cups[start_pos] << :stone
      end
      count -= 1
    end

    # render
    # ending_cup_idx = start_pos
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt,
    #or ending_cup_idx


    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else

      ending_cup_idx
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
  end

  def winner
  end
end
