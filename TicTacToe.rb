class Player
    attr_accessor (:name)
    @@count=0
    @@win=false
    @@tie=false
    @@board = [" "," "," "," "," "," "," "," "," ","  ","  ","  ","  ","  ","  ","  ","  ","  ","  ","  ","  ","  ","  ","  ","  "]
    @@board_index = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
    
    def self.display_board
       "          |       |       |       |                     |       |       |       |       \n" \
       "      #{@@board[0]}   |   #{@@board[1]}   |   #{@@board[2]}   |   #{@@board[3]}   |   #{@@board[4]}             #{@@board_index[0]}   |   #{@@board_index[1]}   |   #{@@board_index[2]}   |   #{@@board_index[3]}   |   #{@@board_index[4]}   \n" \
       "   -------+-------+-------+-------+-------       -------+-------+-------+-------+-------\n" \
       "          |       |       |       |                     |       |       |       |       \n" \
       "      #{@@board[5]}   |   #{@@board[6]}   |   #{@@board[7]}   |   #{@@board[8]}   |   #{@@board[9]}            #{@@board_index[5]}   |   #{@@board_index[6]}   |   #{@@board_index[7]}   |   #{@@board_index[8]}   |   #{@@board_index[9]}   \n" \
       "   -------+-------+-------+-------+-------       -------+-------+-------+-------+-------\n" \
       "          |       |       |       |                     |       |       |       |       \n" \
       "      #{@@board[10]}  |   #{@@board[11]}  |   #{@@board[12]}  |   #{@@board[13]}  |   #{@@board[14]}           #{@@board_index[10]}   |  #{@@board_index[11]}   |  #{@@board_index[12]}   |  #{@@board_index[13]}   |   #{@@board_index[14]}   \n" \
       "   -------+-------+-------+-------+-------       -------+-------+-------+-------+-------\n" \
       "          |       |       |       |                     |       |       |       |       \n" \
       "      #{@@board[15]}  |   #{@@board[16]}  |   #{@@board[17]}  |   #{@@board[18]}  |   #{@@board[19]}           #{@@board_index[15]}   |  #{@@board_index[16]}   |  #{@@board_index[17]}   |  #{@@board_index[18]}   |   #{@@board_index[19]}   \n" \
       "   -------+-------+-------+-------+-------       -------+-------+-------+-------+-------\n" \
       "          |       |       |       |                     |       |       |       |       \n" \
       "      #{@@board[20]}  |   #{@@board[21]}  |   #{@@board[22]}  |   #{@@board[23]}  |   #{@@board[24]}           #{@@board_index[20]}   |  #{@@board_index[21]}   |  #{@@board_index[22]}   |  #{@@board_index[23]}   |   #{@@board_index[24]}   \n" \
       "  "\
    end
    puts self.display_board
    
  
  def initialize
      @@count +=1
      puts "Name player #{@@count}:"
      @name = gets.chomp.capitalize
  end
 
  
  def self.launch(p1,p2)
      @@letter= "X"
      @@player=p1
      while @@win==false && @@tie==false
          @@player.place
          @@player ==p1 ? @@player=p2 : @@player=p1
          @@letter == "X" ? @@letter= "O" : @@letter= "X"
          self.win(p1,p2)
      end
  end

  def place
    puts "#{@name}, choose the number that you want to place your #{@@letter}."
    place_num = gets.chomp.to_i
        if @@board[place_num-1]==" " 
            @@board[place_num-1] = @@letter
            puts Player.display_board
        elsif @@board[place_num-1]=="  "
            @@board[place_num-1] = "#{@@letter } "
            puts Player.display_board
        elsif !place_num.between?(1,25)
            puts "Please choose between 0 to 25."
            self.place
        else
            puts "Oops!That spot has already been taken. Please choose another one."
            self.place
        end
  end


  
  protected
  def self.win(p1,p2)
    @win_arr=[
        [0,1,2,3],[1,2,3,4],[5,6,7,8],[6,7,8,9],[10,11,12,13],[11,12,13,14],[15,16,17,18],[16,17,18,19],
        [5,11,17,23],[0,6,12,18],[6,12,18,24],[1,7,13,19],[3,7,11,15],[4,8,12,16],[8,12,16,20],[9,13,17,21],
        [0,5,11,15],[5,11,15,20],[1,6,11,16],[6,11,16,21],[2,7,12,17],[7,12,17,22],[3,8,13,18],[8,13,18,23],[4,9,14,19],[9,14,19,24]
        ]
    
    @win_arr.each do |num| 
        first,second,third,fourth=num
        @@win=true if (@@board[first]=="X" || @@board[first]=="X " ) && (@@board[second]== "X" || @@board[second]== "X " ) && (@@board[third]=="X" || @@board[third]=="X ") && (@@board[fourth]=="X" || @@board[fourth]=="X ")
        @@win=true if (@@board[first]=="O" || @@board[first]=="O ") && (@@board[second]== "O" || @@board[second]== "O ") && (@@board[third]=="O" || @@board[third]=="O ")&& (@@board[fourth]=="O" || @@board[fourth]=="O ")
    end
      
    if @@win==true
        @@player ==p1 ? @@player=p2 : @@player=p1
        puts "#{@@player.name} Wins!"
    end
    
        
    if @@board.all?{|n| n=="X" || n=="O" || n=="X " || n=="O "}
        puts "There no more space. The game comes to a Tie!"
        return @@tie=true
    end
  end

end

player1 = Player.new
player2 = Player.new

Player.launch(player1,player2)