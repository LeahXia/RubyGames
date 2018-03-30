class BabyDragon
  def initialize name
    @babyName = name
    @foodInBelly = 10
    @stuffInIntestine = 0
    @sleep = false
    puts "#{@babyName} is born."
  end
  
  def timePass
    if @foodInBelly > 0
          @foodInBelly -= 1
          @stuffInIntestine += 1
    else
        puts "#{@babyName} has died of hungray."
        exit
    end
      
    if @stuffInIntestine >= 10
        @stuffInIntestine = 0
        puts 'Whoops!  ' + @babyName + ' had an accident...'
    end
    
    if @foodInBelly < 2
        if @sleep
            @sleep = false
            puts "#{@babyName} wakes up and "
        end
        puts "#{@babyName} is crying for food."
        
    end
    if @stuffInIntestine > 8
        if @sleep
            @sleep = false
            puts "#{@babyName} wakes up and "
        end
        puts "#{@babyName} does the potty dance."
    
    end  
  end
  def feed 
      puts "You feed #{@babyName}."
      @foodInBelly += 1
      timePass
  end
  def walk 
      puts "You walk #{@babyName}."
      @stuffInIntestine = 0
      timePass
  end
  def putToBed 
      puts "You put #{@babyName} to bed."
      @sleep = true
      3.times do
        if @sleep
            timePass
        end
        if @sleep
            puts ' snores, filling the room with smoke.'
        end
      end
      if @sleep
          @sleep = false
          puts "#{@babyName} wakes up slowly."
      end
  end

pet = BabyDragon.new "Vahid"
talk = "Hi Leah. Are you going to feed me, walk me or put me to bed?"
puts talk
if talk == ""
    puts "Bye for now, Leah."
end
while talk != ""
  talk = gets.chomp
  talk.downcase!
  if talk == "feed"
      pet.feed
  elsif talk == "walk"
      pet.walk
  elsif talk == "put you to bed"
      pet.putToBed
  else
      puts "Sorry Leah, I don't understand. Are you going to feed me, walk me or put me to bed?"
  end
end
end
    