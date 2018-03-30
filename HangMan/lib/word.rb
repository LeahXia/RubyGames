class Word

  def init
    @dictionary = []
    @@word = ""
    setup
  end

  def self.word
    @@word
  end
  # setup the secret word
  def setup
    loadIn
    randomWord
  end

  def loadIn
    File.open("5desk.txt", 'r') do |file|
      while !file.eof?
        word = file.readline.chomp
        #puts word.inspect
        @dictionary << word if word.length.between?(5,12)
        #puts @dictionary
      end
      #puts @dictionary.length
    end
  end




  def randomWord
    randomNum = rand(@dictionary.length)
    @@word = @dictionary[randomNum]
    #puts randomNum
    #puts @@word
  end

end
