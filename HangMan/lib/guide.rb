
require "board"
require 'yaml'

class Guide



  def load_game?
    puts "Enter 'load' to load your game from last time."
    puts "Enter 'new' to start a new game."
    load_or_new = gets.chomp.downcase
    if load_or_new == "load"
      load_game
      launch!
    elsif load_or_new == "new"
      new_game
      launch!
    else
      puts "You didn't enter the right order. Please enter 'load' or 'new'"
      load_game?
    end
  end

  def new_game
    word = Word.new
    word.init
    @board = Board.new
    @board.init
    @letters = Word.word.split("")
  end

  def launch!
    until end?
    guess
    compare
    end
  end

  def guess
    puts "Select a letter."
    @guess = gets.chomp.downcase
    if @board.wrongGuesses.include?(@guess) || @board.rightArr.include?(@guess)
      puts "You've tried #{@guess}, please select another letter."
      @guess = gets.chomp.downcase
    elsif @guess == "save"
      save_game
      exit!
    elsif @guess.length >1
      puts "You've selected more than 1 letter."
      launch!
    end
  end

  def compare
    @index_arr = @letters.each_with_index.map {|letter,index| letter == @guess ? index : nil}
    if @index_arr.any?
      @index_arr.map {|i| @board.rightArr[i] = @guess if i.is_a? Integer }
      p @board.rightArr
    else
      @board.wrongGuesses << @guess
    end
    @board.guessesLeft -= 1
    @board.config
  end

  def end?
    if @board.rightArr.none? {|l| l=="_"}
      puts "You Win!"
      exit!
    elsif @board.guessesLeft == 0
      puts "Hang 'em high!"
      exit!
    end
  end

  def save_game

    yaml = YAML::dump(self)
    gamefile = File.new("save/saved.yaml", "w")
    gamefile.puts yaml
    #gamefile.puts @@word = Word.word
    gamefile.close
  end

  def load_game
    gamefile = File.open("save/saved.yaml", "r")
    yaml = gamefile.read
    yaml_load = YAML::load(yaml)
    gamefile.close
    #@board.config
    #p @rightArr
    @board.rightArr = @rightArr
    @board.wrongGuesses = @wrongGuesses
    @board.guessesLeft = @guessesLeft
    #p yaml_load
    p @board.rightArr

  end

end
