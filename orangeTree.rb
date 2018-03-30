class OrangeTree
  def initialize
      @height = 0
      @age = 0
      @fruit = 0
      @waterCount = 0
      puts "A new Orange Tree is planted."
  end
  def oneYearPass
      @fruit = 0
      @height += 10
      @age += 1
      puts "Your orange tree just turned one year older! It is now #{@age} years old and #{@height} inches tall."
      if @age > 2
          @fruit = @age*3 + rand(3)
          puts "This year, your orange tree has grown #{@fruit} fruits, make sure to pick up them before they fall off."  
      end
      
      if @age > 4
          puts "Your orange tree has died."
          exit
      end
  end
  def water
      @waterCount += 1
      if @waterCount <3
      puts "You've just watered the orange tree and it grew taller. You need to water it #{3-@waterCount} more times this year."
      elsif @waterCount == 3
          oneYearPass
          @waterCount = 0 
      end
   end  
   def pickAnOrange
       if @fruit > 0
           @fruit -= 1
           @delicious = ["super sweet","just ok","not delicious"]
           puts "You picked up an orange from the tree and the fruit that you picked is #{@delicious[rand(3)]}."
       else 
           puts "There's no more orange on the tree for this year."
       end
   end
    
end

tree = OrangeTree.new
tree.water
tree.water
tree.water
tree.water
tree.water
tree.water
tree.water
tree.water
tree.water
puts ""
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.pickAnOrange
tree.water
tree.water
tree.water
tree.water
tree.water
tree.water
tree.water
tree.water
tree.water