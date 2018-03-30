class Mastermind

def initialize
    @color_hash = {0=>"red", 1=>"yellow", 2=>"blue",3=>"green",4=>"gray",5=>"white",6=>"black",7=>"purple"}
    @round_count = 0
    @@available = [0,1,2,3]
    self.player
end
    
def player
    puts "Do you want to be the SETTER or GUESSER?"
    @decision = gets.chomp.downcase
    if @decision == "guesser"
        self.secret_color
        self.guess
    elsif @decision == "setter"
        self.guess
    else
        puts "Please choose between setter and guesser."
        self.player
    end
end


def secret_color
    @secret_color = []
    while @secret_color.length < 4
        @color = @color_hash[rand(8)]
        @secret_color << @color if !@secret_color.include?(@color)  
    end
end


def guess
    @tempt = []
    @i = 1
    puts " "
    puts 'Among (red, yellow, blue, green, gray, white, black, purple)'
    while @i<5
        puts "Please choose a color that you want to place in position #{@i} :"
        @choice = gets.chomp
            if @color_hash.has_value?(@choice) && !@tempt.include?(@choice)
                @tempt << @choice
                @i +=1
            else
                puts " "
                puts "Please choose a color among the given colors!"
                puts "Or don't repeat the color that you've already chosen."
                puts " "
            end
    end
    
    if @decision == "guesser"
        @round_count +=1
        puts "Your choice of round #{@round_count}: "
        puts @tempt.inspect
        self.check
    else
        puts "You set the secret colors: #{@tempt.inspect}"
        self.computer_guess
    end
end
 
    
def check
    #right color
    @right_color = []
    @secret_color.each {|c| @right_color << c if @tempt.include?(c)}
    
    #correct position
    @correct_count = 0
    @secret_color.each_index do |i|
          @correct_count +=1 if @secret_color[i]==@tempt[i]      
    end
    self.result
end


    
def computer_guess
    @round_count +=1
    self.secret_color
    puts "round #{@round_count} : "
    puts @secret_color.inspect
    
    self.computer_check
    
end
    
    
def re_guess    
    @round_count +=1
    
    @keep_color.each do |c|
        @index=0
        while !@@available.include?(@index) || @secret_color[@index] ==c
            @index=rand(4)
        end
        @secret_color[@index]= c
        @@available.delete(@index)
    end
    
    @@available.each do |n|
        @color = @color_hash[rand(8)]
        while @secret_color.include?(@color)
            @color = @color_hash[rand(8)]  
        end
        @secret_color[n]=@color
    end 
    
    puts "round #{@round_count} : "
    puts @secret_color.inspect
    @@available = [0,1,2,3]
    self.computer_check
end
    
def computer_check
    @right_color = []
    @tempt.each {|c| @right_color << c if @secret_color.include?(c)}
    @keep_color = @right_color.clone
    
    @correct_count = 0
    
    @tempt.each_with_index do |x,i|
        if @tempt[i] == @secret_color[i] 
            @correct_count +=1 
            @@available.delete(i)
            @keep_color.delete(x)
        end
    end  
    self.result
end
    

def result
    if @correct_count == 4
        puts "You got every secret color in the right place within #{@round_count} rounds! Congrats!"
    else
    puts "You have #{@right_color.length} colors correct within which #{@correct_count} are in the right position."
    puts " "  
        if @round_count < 12 && @decision == "guesser"
           self.guess
        elsif @round_count < 12 && @decision == "setter"
           self.re_guess
        else
            puts "You have guessed 12 times. Game Over."
        end
    end
end
    
end

game=Mastermind.new
