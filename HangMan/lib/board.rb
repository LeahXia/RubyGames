require 'word'

class Board
  #attr_reader :rightArr, :wrongGuesses
  attr_accessor :guessesLeft, :rightArr, :wrongGuesses
  def init
    rightStr = "_ "*(Word.word.length)
    @rightArr = rightStr.split(" ")
    @wrongGuesses = []
    @guessesLeft = Word.word.length+5
    config
  end

  

  def config
    puts " "
    puts @rightArr.join(" ")
    puts " "
    puts "Wrong Guesses: #{@wrongGuesses.to_s} "
    puts "#{@guessesLeft} guesses left."
    puts "Enter 'Save' to save your game and come back to it later."
  end

end
